function organiza_diretorios_musicas --description 'Organiza as musicas de acordo com o artista/album'

	for file in *.mp3
  		# 1. Extrai as tags corretas que você já salvou via interface gráfica
    		set artist (kid3-cli -c "get artist" "$file")
		set album (kid3-cli -c "get album" "$file")
		set title (kid3-cli -c "get title" "$file")

    		# 2. Monta o caminho absoluto da nova pasta baseada nas tags
 		set dest_dir "/home/Jose/picard-musicas/$artist/$album"

  		# 3. Cria a estrutura de pastas (o '-p' garante que não haverá erro se a pasta já existir)
		mkdir -p "$dest_dir"

  		# 4. Move o arquivo original para dentro da pasta, já com o nome limpo do título
   		mv "$file" "$dest_dir/$title.mp3"

    		# 5. Imprime um log visual para você acompanhar o progresso
    		echo "Sucesso: '$title' movido para a pasta de $artist"
	end
end
