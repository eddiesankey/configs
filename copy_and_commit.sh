SOURCE_DIR="$HOME/.configs"
DEST_DIR="$HOME/configs"

DIRS=("fish" "tmux" "nvim" "i3" "rofi")

# Copy directories
for dir in "${DIRS[@]}"; do
    if [ -d "$SOURCE_DIR/$dir" ]; then
        echo "Copying $dir..."
        cp -r "$SOURCE_DIR/$dir" "$DEST_DIR/"
    else
        echo "Directory $dir does not exist in $SOURCE_DIR. Skipping..."
    fi
done

# Git commit and push changes
cd "$DEST_DIR" || exit
git add . 

git commit -m "Update configs"
git push

echo "Copy and commit complete"