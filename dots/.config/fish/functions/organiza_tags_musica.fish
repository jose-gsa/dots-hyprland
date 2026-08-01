
function organiza_tags_musica --description 'Organiza as tags das musicas no diretorio atual'
	for file in *.mp3
    		echo "Processando: $file"
    
   		 # 1. Aplica a máscara no nome do arquivo para preencher Artista e Título
   		 kid3-cli -c "totag '%{artist} - %{title}' 2" "$file"
    
   		 # 2. Lê o Título recém-extraído e guarda em uma variável
  		  set titulo (kid3-cli -c "get title" "$file")
    
   		 # 3. Define o Álbum, zera a numeração da faixa e salva no disco
   		 kid3-cli -c "set album '$titulo - Single'" -c "set track ''" -c "save" "$file"
	end
end

