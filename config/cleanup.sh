#/bin/sh

echo "Cleaning up archlinux..."

# Remove pacman cache
sudo pacman -Scc

# Remove unused packages
sudo pacman -Rns $(pacman -Qtdq) || true

echo ""
echo "Archlinux cleaned up."
