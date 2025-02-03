use std::fs;
use std::process::Command;
use toml::Value;
use dialoguer::{theme::ColorfulTheme, Select};

fn main() {
    // Read the configuration file
    let config_content = fs::read_to_string("config.toml")
        .expect("Failed to read configuration file");

    // Parse the configuration file
    let config: Value = config_content.parse::<Value>()
        .expect("Failed to parse configuration file");

    // Get the commands from the configuration
    let commands = config.get("commands")
        .expect("No commands found in configuration file")
        .as_table()
        .expect("Commands should be a table");

    // Create a list of options
    let options: Vec<&String> = commands.keys().collect();

    // Display a menu to select an option
    let selection = Select::with_theme(&ColorfulTheme::default())
        .with_prompt("Select an option")
        .default(0)
        .items(&options)
        .interact()
        .expect("Failed to interact with the menu");

    let option = options[selection];

    // Check if the specified option exists in the configuration
    if let Some(cmds) = commands.get(option) {
        println!("Executing commands for option: {}", option);
        let cmds = cmds.as_array().expect("Commands should be an array");

        for cmd in cmds {
            let cmd_str = cmd.as_str().expect("Command should be a string");
            let parts: Vec<&str> = cmd_str.split_whitespace().collect();
            if parts.is_empty() {
                continue;
            }

            let output = Command::new(parts[0])
                .args(&parts[1..])
                .output();

            match output {
                Ok(output) => {
                    println!("Output: {}", String::from_utf8_lossy(&output.stdout));
                    if !output.stderr.is_empty() {
                        eprintln!("Error: {}", String::from_utf8_lossy(&output.stderr));
                    }
                }
                Err(e) => {
                    eprintln!("Failed to execute command '{}': {}", cmd_str, e);
                }
            }
        }
    } else {
        eprintln!("Option '{}' not found in configuration file", option);
    }
}