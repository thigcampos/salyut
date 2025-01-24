# Salyut | Салют
[Salyut](https://en.wikipedia.org/wiki/Salyut_programme) is an elegant and simple dotfiles manager for macOS, inspired by [GNU Stow](https://www.gnu.org/software/stow/).

## Etymology
Salyut is named after a Soviet space station program that launched the first crewed space station. Here's an excerpt from Wikipedia:
> The Salyut programme (Russian: Салют, IPA: [sɐˈlʲut], meaning "salute" or "fireworks") was the first space station programme, undertaken by the Soviet Union. It involved a series of four crewed scientific research space stations and two crewed military reconnaissance space stations over a period of 15 years, from 1971 to 1986. In one respect, Salyut had the space-race task of carrying out long-term research into the problems of living in space and a variety of astronomical, biological, and Earth-resources experiments. On the other hand, the USSR used this civilian programme as a cover for the highly secretive military Almaz stations, which flew under the Salyut designation. Salyut 1, the first station in the program, became the world's first crewed space station.

## Usage
Initially, you must create the package within your dotfiles directory:

```sh
# Creating a package for nvim
mkdir nvim/.config/
mv ~/.config/nvim nvim/.config/nvim
```

```sh
# Creating a package for ghostty (in macOS)
mkdir ghostty/Library/Application\ Support/com.mitchellh.ghostty/
mv ~/Library/Application\ Support/com.mitchellh.ghostty/config ghostty/Library/Application\ Support/com.mitchellh.ghostty/config
```

With your *salyut* packages available, you can push them to your machine:

```sh
salyut nvim
```

```sh
salyut ghostty
```

## Installation
Salyut is still under development and I decided to only make a release when it's core features are unit-tested.
Given this scenario, if you want to use Salyut's binary, you will need to build it yourself.

Check [Swift](https://www.swift.org/install/macos/)'s guide on how to install it, after that, clone the Salyut project:

```sh
git clone https://github.com/thigcampos/salyut.git

```

Then, enter the directory and run:

```sh
swift build
```

The binary will be available under `salyut/.build/debug/salyut`.

## Contribution
Salyut is developed completely in the open source model, and your contributions are more than welcome.

This project does not come with GitHub Issues-based support, and users are instead encouraged to become active participants in its continued development — by fixing any bugs that they encounter, or by improving the documentation wherever it’s found to be lacking.

If you wish to make a change, open a Pull Request — even if it just contains a draft of the changes you’re planning, or a test that reproduces an issue — and we can discuss it further from there.

Hope you’ll enjoy using Salyut!

## License
This project is licensed under GNU GPLv3 License. Check [LICENSE](LICENSE) for more information.
