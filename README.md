# CDX - Directory Navigation Tool

A simple command-line tool for quick directory navigation using arrow-like syntax.

## Description

CDX allows you to navigate up multiple directory levels using an intuitive arrow-like syntax. Instead of typing multiple `cd ../` commands, you can use patterns like `<--` to move up directories quickly.

## Installation

1. Build the project:
```bash
cargo build --release
```

2. Install the binary:
```bash
sudo cp target/release/cdx /usr/local/bin/cdx-bin
```

3. Create the wrapper script:
```bash
sudo tee /usr/local/bin/cdx << 'EOF'
#!/bin/bash
output=$(/usr/local/bin/cdx-bin "$1")
if [ $? -eq 0 ]; then
    cd "$output"
else
    echo "$output"
fi
EOF
```

4. Make both files executable:
```bash
sudo chmod +x /usr/local/bin/cdx-bin
sudo chmod +x /usr/local/bin/cdx
```

5. Add to your shell configuration:
```bash
# Add to ~/.zshrc or ~/.bashrc
alias cdx="source /usr/local/bin/cdx"
```

6. Reload your shell:
```bash
source ~/.zshrc  # or source ~/.bashrc
```

## Usage

The syntax is simple: use `<` followed by one or more `-` characters to indicate how many levels up you want to go.

```bash
cdx \<-      # Go up one directory (equivalent to cd ..)
cdx \<--     # Go up two directories (equivalent to cd ../..)
cdx \<---    # Go up three directories
cdx \<----   # Go up four directories
```

Note: The backslash is required to escape the `<` character in the shell.

## Examples

```bash
# Current path: /home/user/projects/webapp/src/components
cdx \<--
# New path: /home/user/projects/webapp

# Current path: /var/www/html/images
cdx \<---
# New path: /var
```

## Requirements

- Rust (for building)
- Unix-like operating system (Linux, macOS)
- Bash or Zsh shell

## Building from Source

1. Clone the repository:
```bash
git clone <repository-url>
cd cdx
```

2. Build using Cargo:
```bash
cargo build --release
```

The binary will be available at `target/release/cdx`

## License

MIT License

## Contributing

Feel free to open issues or submit pull requests if you have suggestions for improvements.

## Author

Ittipat jitrada