function envia_musicas
    echo "Sincronizando novas músicas com o servidor Jellyfin..."
    rsync -avh --ignore-existing ~/picard-musicas/ ~/jellyfin-files/Musicas/
    echo "Sincronização de áudio concluída!"
end
