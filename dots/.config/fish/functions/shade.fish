function shade
    # Configuração: Ajuste para a pasta onde seus arquivos .glsl finais são gerados
    set -l SHADER_DIR "$HOME/.config/hypr/shaders"
    
    set -l action $argv[1]
    set -l shader_name $argv[2]
    set -l shader_path "$SHADER_DIR/$shader_name.glsl"

    # Captura o shader atualmente ativo usando hyprctl (via JSON)
    set -l current_shader (hyprctl getoption decoration:screen_shader -j | jq -r '.str')

    switch "$action"
        case 'on'
            if test -f "$shader_path"
                hyprctl keyword decoration:screen_shader "$shader_path" > /dev/null
            else if test -f "$action" # Caso passe o caminho absoluto direto
                hyprctl keyword decoration:screen_shader "$action" > /dev/null
            else
                echo "Erro: Shader '$shader_name' não encontrado em $SHADER_DIR"
            end

        case 'off'
            hyprctl keyword decoration:screen_shader "" > /dev/null

        case 'toggle'
            # Se o shader atual já for o que queremos ativar, desliga. Senão, liga.
            if test "$current_shader" = "$shader_path"
                hyprctl keyword decoration:screen_shader "" > /dev/null
            else
                if test -f "$shader_path"
                    hyprctl keyword decoration:screen_shader "$shader_path" > /dev/null
                else
                    echo "Erro: Shader '$shader_name' não encontrado."
                end
            end

        case '*'
            echo "Uso: shade [on|off|toggle] [nome_do_shader]"
    end
end
