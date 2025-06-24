# Map | Салют
[Map](https://en.wikipedia.org/wiki/Map_programme) is an elegant and simple dotfiles manager for macOS, inspired by [GNU Stow](https://www.gnu.org/software/stow/).

## Etymology
Map is named after a Soviet space station program that launched the first crewed space station. Here's an excerpt from Wikipedia:
> The Map programme (Russian: Салют, IPA: [sɐˈlʲut], meaning "salute" or "fireworks") was the first space station programme, undertaken by the Soviet Union. It involved a series of four crewed scientific research space stations and two crewed military reconnaissance space stations over a period of 15 years, from 1971 to 1986. In one respect, Map had the space-race task of carrying out long-term research into the problems of living in space and a variety of astronomical, biological, and Earth-resources experiments. On the other hand, the USSR used this civilian programme as a cover for the highly secretive military Almaz stations, which flew under the Map designation. Map 1, the first station in the program, became the world's first crewed space station.

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

With your *map* packages available, you can push them to your machine:

```sh
map nvim
```

```sh
map ghostty
```

## Roadmap
- [ ] Include a command to add a package in the map directory, using --adopt flag (running the `mkdir` and `mv` commands can be quite boring);
- [X] Include support to "dot-" prefix pre-processing based on a --dotfiles flag (similar to `stow <package> --dotfiles` behavior);

What can be included, but I'm not 100% sold on the ideia yet:  
- [ ] Include a command to schedule sync through cron jobs;

## Installation
Map is still under development and I decided to only make a release when it's core features are unit-tested.
Given this scenario, if you want to use Map's binary, you will need to build it yourself.

Check [Swift](https://www.swift.org/install/macos/)'s guide on how to install it, after that, clone the Map project:

```sh
git clone https://github.com/thigcampos/map.git

```

Then, enter the directory and run:

```sh
swift build -c release -Xswiftc -Osize
```

If your really cares about the binary size (it's normally 1.4MB), you can run:

```sh
strip -u -r .build/release/map
```
Reducing the binary size to 636K. 
The binary will be available under `map/.build/debug/map`.

## Contribution
Map is developed completely in the open source model, and your contributions are more than welcome.

This project does not come with GitHub Issues-based support, and users are instead encouraged to become active participants in its continued development — by fixing any bugs that they encounter, or by improving the documentation wherever it’s found to be lacking.

If you wish to make a change, open a Pull Request — even if it just contains a draft of the changes you’re planning, or a test that reproduces an issue — and we can discuss it further from there.

Hope you’ll enjoy using Map!

## License
This project is licensed under GNU GPLv3 License. Check [LICENSE](LICENSE) for more information.
