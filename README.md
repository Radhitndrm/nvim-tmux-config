# 🚀 Nvim-Tmux-Config

Konfigurasi development environment yang terintegrasi untuk Neovim, tmux, Fish shell, dan Kitty terminal.

## 📋 Daftar Isi

- [Tentang](#tentang)
- [Fitur](#fitur)
- [Prerequisites](#prerequisites)
- [Instalasi](#instalasi)
- [Konfigurasi](#konfigurasi)
- [Keybindings](#keybindings)
- [Screenshot](#screenshot)
- [Kredit](#kredit)

## 🎯 Tentang

Repository ini berisi konfigurasi personal untuk development environment yang modern dan efisien, meliputi:

- **Neovim**: Editor berbasis vim dengan konfigurasi Kickstart.nvim
- **tmux**: Terminal multiplexer dengan tema monochrome kustom
- **Fish Shell**: Shell yang user-friendly dengan auto-suggestion
- **Kitty**: Terminal emulator yang cepat dan modern

## ✨ Fitur

### Neovim
- Berbasis [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- Plugin manager menggunakan lazy.nvim
- Konfigurasi modular dan mudah dikustomisasi
- LSP, autocompletion, dan syntax highlighting

### tmux
- **Plugin Manager**: TPM (Tmux Plugin Manager)
- **Plugins**:
  - tmux-sensible: Pengaturan default yang masuk akal
  - tmux-resurrect: Simpan dan restore session
  - tmux-continuum: Auto-save session secara otomatis
  - tmux-prefix-highlight: Indikator prefix di status bar
- **Custom Keybindings**: Prefix `Ctrl-Space`
- **Tema**: Monochrome dengan powerline arrows
- **Fitur Tambahan**:
  - Git branch indicator
  - Music player status (playerctl)
  - Mouse support
  - Vi mode untuk copy-paste
  - Split window dengan `|` dan `-`

### Fish Shell
- Greeting kustom dengan logo Arch
- Warna kustom
- Integrasi dengan Spicetify

### Kitty
- Tema Dracula
- Font: FiraCode Nerd Font Mono
- Background opacity: 0.85
- Cursor trail effect

## 📦 Prerequisites

Pastikan sistem anda sudah terinstall:

- **Neovim** >= 0.9.0
- **tmux** >= 3.0
- **Fish shell** >= 3.0
- **Kitty terminal** >= 0.26.0
- **Git**
- **Node.js** (untuk beberapa plugin Neovim)
- **FiraCode Nerd Font** (untuk icon dan powerline)

### Install Prerequisites di Arch Linux

```bash
sudo pacman -S neovim tmux fish kitty git nodejs npm
yay -S nerd-fonts-fira-code  # atau font nerd lainnya
```

### Install Prerequisites di Ubuntu/Debian

```bash
sudo apt update
sudo apt install neovim tmux fish kitty git nodejs npm
# Install Nerd Font secara manual dari https://www.nerdfonts.com/
```

## 🔧 Instalasi

### 1. Clone Repository

```bash
git clone https://github.com/Radhitndrm/nvim-tmux-config.git
cd nvim-tmux-config
```

### 2. Backup Konfigurasi Lama (Opsional)

```bash
# Backup konfigurasi yang sudah ada
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.tmux.conf ~/.tmux.conf.bak
mv ~/.config/fish ~/.config/fish.bak
mv ~/.config/kitty ~/.config/kitty.bak
```

### 3. Install Konfigurasi

#### Neovim

```bash
# Copy konfigurasi Neovim
cp -r nvim ~/.config/

# Buka Neovim, plugin akan terinstall otomatis
nvim
```

#### tmux

```bash
# Copy konfigurasi tmux
cp .tmux.conf ~/

# Install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Mulai tmux
tmux

# Install plugin dengan Prefix + I (Ctrl-Space + Shift-I)
```

#### Fish Shell

```bash
# Copy konfigurasi Fish
cp -r fish ~/.config/

# Set Fish sebagai default shell (opsional)
chsh -s $(which fish)
```

#### Kitty

```bash
# Copy konfigurasi Kitty
cp -r kitty ~/.config/

# Clone tema Kitty (jika belum ada)
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
```

## ⚙️ Konfigurasi

### Neovim

Konfigurasi Neovim terletak di `~/.config/nvim/`:

- `init.lua`: Entry point konfigurasi
- `lua/options.lua`: Opsi editor
- `lua/keymaps.lua`: Keybindings kustom
- `lua/lazy-plugins.lua`: Daftar plugin
- `lua/custom/plugins/`: Plugin tambahan
- `lua/ndrm/plugins/`: Plugin personal

Edit file-file tersebut sesuai kebutuhan anda.

### tmux

Konfigurasi tmux terletak di `~/.tmux.conf`. Untuk meload ulang konfigurasi setelah edit:

```bash
# Dalam tmux session
Ctrl-Space + r
```

### Fish

Konfigurasi Fish terletak di `~/.config/fish/config.fish`. Reload dengan:

```bash
source ~/.config/fish/config.fish
```

### Kitty

Konfigurasi Kitty terletak di `~/.config/kitty/kitty.conf`. Reload dengan:

```bash
# Dalam Kitty terminal
Ctrl + Shift + F5
```

## ⌨️ Keybindings

### tmux

**Prefix**: `Ctrl-Space`

#### Window & Pane Management
- `Prefix + |`: Split window horizontal
- `Prefix + -`: Split window vertikal
- `Prefix + h/j/k/l`: Navigasi antar pane (vim-style)
- `Prefix + H/J/K/L`: Resize pane
- `Alt + j`: Previous window
- `Alt + k`: Next window
- `Alt + h`: Previous client
- `Alt + l`: Next client

#### Shortcuts
- `Prefix + f`: Tmux sessionizer
- `Prefix + r`: Reload konfigurasi

#### Copy Mode
- `Prefix + [`: Enter copy mode
- `v`: Begin selection (dalam copy mode)
- `y`: Copy selection (dalam copy mode)

### Neovim

**Leader**: `Space`

Keybindings mengikuti konfigurasi Kickstart.nvim default. Beberapa yang umum:

- `Space + sh`: Search help
- `Space + sf`: Search files
- `Space + sg`: Search by grep
- `Space + ?`: Recently opened files

Lihat `~/.config/nvim/lua/keymaps.lua` untuk daftar lengkap.

## 📸 Screenshot

<!-- Tambahkan screenshot di sini jika diperlukan -->

## 🙏 Kredit

- [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) - Template konfigurasi Neovim
- [tmux](https://github.com/tmux/tmux) - Terminal multiplexer
- [Fish Shell](https://fishshell.com/) - User-friendly shell
- [Kitty](https://sw.kovidgoyal.net/kitty/) - GPU-accelerated terminal emulator
- [Nerd Fonts](https://www.nerdfonts.com/) - Iconic fonts

## 📝 License

Konfigurasi ini bersifat bebas untuk digunakan dan dimodifikasi sesuai kebutuhan anda.

## 🤝 Kontribusi

Feel free to fork dan submit pull request untuk improvement!

---

**Happy Coding! 🎉**
