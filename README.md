# Dot
Dot is an elegant and simple dotfiles manager for macOS, inspired by [GNU Stow](https://www.gnu.org/software/stow/).

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

With your *dot* packages available, you can push them to your machine:

```sh
dot nvim
```

```sh
dot ghostty
```

## Roaddot
- [ ] Include a command to add a package in the dot directory, using --adopt flag (running the `mkdir` and `mv` commands can be quite boring);
- [X] Include support to "dot-" prefix pre-processing based on a --dotfiles flag (similar to `stow <package> --dotfiles` behavior);

What can be included, but I'm not 100% sold on the ideia yet:  
- [ ] Include a command to schedule sync through cron jobs;

## Installation
Dot is still under development and I decided to only make a release when it's core features are unit-tested.
Given this scenario, if you want to use Dot's binary, you will need to build it yourself.

Check [Swift](https://www.swift.org/install/macos/)'s guide on how to install it, after that, clone the Dot project:

```sh
git clone https://github.com/thigcampos/dot.git

```

Then, enter the directory and run:

```sh
swift build -c release -Xswiftc -Osize
```

If your really cares about the binary size (it's normally 1.4MB), you can run:

```sh
strip -u -r .build/release/dot
```
Reducing the binary size to 636K. 
The binary will be available under `dot/.build/debug/dot`.

## Contribution
Dot is developed completely in the open source model, and your contributions are more than welcome.

This project does not come with GitHub Issues-based support, and users are instead encouraged to become active participants in its continued development — by fixing any bugs that they encounter, or by improving the documentation wherever it’s found to be lacking.

If you wish to make a change, open a Pull Request — even if it just contains a draft of the changes you’re planning, or a test that reproduces an issue — and we can discuss it further from there.

Hope you’ll enjoy using Dot!

## License
This project is licensed under GNU GPLv3 License. Check [LICENSE](LICENSE) for more information.
