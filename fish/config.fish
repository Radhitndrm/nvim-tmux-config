
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Hilangkan greeting bawaan
set -U fish_greeting ""

# Ganti ~ di HOME dengan logo Arch
set -g theme_home_symbol ""

# Warna khas Arch Linux
set -g fish_color_cwd cyan
set -g fish_color_cwd_root red
set -g fish_color_user brblue
set -g fish_color_host brblue

# Path untuk spicetify
fish_add_path /home/ndrm/.spicetify
