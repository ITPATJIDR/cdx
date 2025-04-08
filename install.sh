#!/bin/bash

# Copy the Rust binary
sudo cp target/release/cdx /usr/local/bin/cdx-bin

# Create the wrapper script
sudo tee /usr/local/bin/cdx << 'EOF'
#!/bin/bash
output=$(/usr/local/bin/cdx-bin "$1")
if [ $? -eq 0 ]; then
    cd "$output"
else
    echo "$output"
fi
EOF

# Make both files executable
sudo chmod +x /usr/local/bin/cdx-bin
sudo chmod +x /usr/local/bin/cdx

# Add to .zshrc to make it work with the shell
echo 'alias cdx="source /usr/local/bin/cdx"' >> ~/.zshrc

echo "Installation complete! Please restart your terminal or run: source ~/.zshrc"