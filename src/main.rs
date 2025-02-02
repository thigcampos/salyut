mod dirs;

use clap::Parser;
use clap::Subcommand;
use dirs::*;
use std::path::PathBuf;

#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
#[command(arg_required_else_help = true)]
struct Porto {
    /// Package to be installed
    package_name: Option<String>,

    #[command(subcommand)]
    command: Option<Commands>,
}

#[derive(Subcommand, Debug)]
enum Commands {
    /// Adds a documentation to your local environment
    Add {
        /// Documentation set to be added
        package_name: String,
        path: PathBuf,
    },
    /// List all packages available
    List,
}

fn main() {
    let porto = Porto::parse();

    if let Some(package_to_be_installed) = porto.package_name.as_deref() {
        install_package(package_to_be_installed)
    }

    match &porto.command {
        Some(Commands::Add { package_name, path }) => add_package(package_name, path),
        Some(Commands::List) => list_all_packages(),
        None => {}
    }
}

fn install_package(package_name: &str) {
    println!("{package_name} will be installed");
}

fn add_package(package_name: &str, path_to_config: &PathBuf) {
    println!(
        "{} will be added in your dotfiles directory under the name {package_name}",
        path_to_config.display()
    );
}

fn list_all_packages() {
    println!("All packages");
}
