# Porto 
Porto is a simple yet elegant dotfiles manager for macOS and Linux, inspired by [GNU Stow](https://www.gnu.org/software/stow/).

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

With your *porto* packages available, you can push them to your machine:

```sh
porto nvim
```

```sh
porto ghostty
```

#### Roadmap
- Include a command to add a package in the porto directory (running the `mkdir` and `mv` commands can be quite boring);
- Include support to "dot-" prefix pre-processing based on a --dot flag (similar to `stow <package> --dotfiles` behavior);

What can be included, but I'm not 100% sold on the ideia yet:  
- Include a command to schedule sync through cron jobs;

## Installation
Porto is still under development and I decided to only make a release when it's core features are unit-tested.
Given this scenario, if you want to use Porto's binary, you will need to build it yourself.

Check [Rust](https://www.rust-lang.org/tools/install)'s guide on how to install it, after that, clone the Porto project:

```sh
git clone https://github.com/thigcampos/porto.git

```

Then, enter the directory and run:

```sh
cargo build --release
```

## Contribution
Porto is developed completely in the open source model, and your contributions are more than welcome.

This project does not come with GitHub Issues-based support, and users are instead encouraged to become active participants in its continued development — by fixing any bugs that they encounter, or by improving the documentation wherever it’s found to be lacking.

If you wish to make a change, open a Pull Request — even if it just contains a draft of the changes you’re planning, or a test that reproduces an issue — and we can discuss it further from there.

Hope you’ll enjoy using Porto!

## License
This project is licensed under GNU GPLv3 License. Check [LICENSE](LICENSE) for more information.
