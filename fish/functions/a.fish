function a --description 'Alias php artisan only in Laravel project'
    # Cek apakah ada file artisan di folder saat ini
    if test -f artisan
        php artisan $argv
    else
        echo "Not a Laravel project folder!"
    end
end
