function lrcget
    echo "Iniciando LRCGET (AppImage) com fix de renderização do Wayland..."
    
    # Defina o caminho absoluto para o seu arquivo AppImage
    set APPIMAGE_PATH ~/Downloads/LRCGET_2.1.0_amd64.AppImage 
    
    # Injeta a variável no ambiente e executa o binário diretamente
    env WEBKIT_DISABLE_DMABUF_RENDERER=1 $APPIMAGE_PATH $argv
end
