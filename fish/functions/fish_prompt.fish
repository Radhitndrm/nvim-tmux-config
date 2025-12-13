
function fish_prompt
    # --- Blok Arch ---
    set_color -b "#2E3440" "#E5E9F0" # bg gelap + teks terang
    echo -n "  "
    set_color -b "#3B4252" -o "#2E3440"
    echo -n ""

    # --- Blok Folder/Home ---
    set_color -b "#3B4252" "#88C0D0" # abu + cyan lembut
    if test "$PWD" = "$HOME"
        echo -n "  ~ "
        set_color -b normal -o "#3B4252"
        echo -n ""
    else
        echo -n "  "
        set_color -b "#2E3440" -o "#3B4252" # transisi
        echo -n ""
    end

    # --- Blok Nama Folder (kalau bukan home) ---
    if test "$PWD" != "$HOME"
        set_color -b "#2E3440" "#D08770" # folder pakai gold sunlight
        echo -n " "(basename $PWD)" "
        set_color -b normal -o "#2E3440"
        echo -n ""
    end

    # --- End ---
    set_color normal
    echo -n " "
end
