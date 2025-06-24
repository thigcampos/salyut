// The Swift Programming Language
// https://docs.swift.org/swift-book
//
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Foundation

@main
struct Map: ParsableCommand {
    @Flag(help: "Enables special handling for mapped packages that start with 'dot-' and not '.'")
    var dotfiles = false

    @Argument(help: "A package from dotfiles directory")
    var package: String

    mutating func run() throws {
        print("Installing \(package)...")
        let files = FileManager.default

        let cwd = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        let home = URL(fileURLWithPath: files.homeDirectoryForCurrentUser.path())

        let packagePath = URL(fileURLWithPath: package, isDirectory: true, relativeTo: cwd)
        let packageContent = try files.contentsOfDirectory(atPath: packagePath.path)

        try createSymLink(
            packageContent: packageContent, baseSourceURL: packagePath, baseTargetURL: home)
    }

    func createSymLink(packageContent: [String], baseSourceURL: URL, baseTargetURL: URL) throws {
        for content in packageContent {
            let linkSource = baseSourceURL.appendingPathComponent(content)

            let contentPath =
                dotfiles ? content.replacingOccurrences(of: "dot-", with: ".") : content
            let linkTarget = baseTargetURL.appendingPathComponent(contentPath)

            if FileManager.default.fileExists(atPath: linkTarget.path) {
                let contentWithinContent = try FileManager.default.contentsOfDirectory(
                    atPath: linkSource.path)
                try createSymLink(
                    packageContent: contentWithinContent, baseSourceURL: linkSource,
                    baseTargetURL: linkTarget)
            } else {
                do {
                    try FileManager.default.createSymbolicLink(
                        at: linkTarget, withDestinationURL: linkSource)
                } catch {
                    print("Installation failed due to: \(error.localizedDescription)")
                }
            }
            print("\(package) installed!")
        }
    }
}
