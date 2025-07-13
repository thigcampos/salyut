const std = @import("std");
const toml = @import("toml");

const DotfilesHashMap = struct {
    source: []const u8,
    destination: []const u8,
};
const Dotfiles = struct {
    files: []DotfilesHashMap,
};

const Dot = struct {
    dotpath: []const u8,
};

// Represents the whole dot.toml config file
const Config = struct {
    dot: Dot,
    dotfiles: Dotfiles,
};

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var parser = toml.Parser(Config).init(allocator);
    defer parser.deinit();

    var result = try parser.parseFile("./examples/example.toml");
    defer result.deinit();

    const config = result.value;

    std.debug.print("{s}\n", .{config.dot.dotpath});

    for (config.dotfiles.files) |file| {
        std.debug.print("{s}\n", .{file.source});
    }
}
