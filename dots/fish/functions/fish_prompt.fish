function fish_prompt
    # --- Paleta de Cores (COM ROXO VIBRANTE) ---
    set -l color_vibrant_purple '#BE95FF' # NOVO - Roxo mais vivo para destaque máximo
    set -l color_structure '#610c87'     # Lavanda (original) mantido para a estrutura base
    set -l color_text '#CBC9CC'          # Cinza claro para o texto principal (caminho)
    set -l color_secondary '#6E6189'     # Roxo médio para info secundária
    set -l color_error '#610c87'         # Erro agora usa o roxo vibrante para chamar mais atenção

    # --- LÓGICA DO PROMPT ---

    # Verifica o status do último comando
    set -l status_color $color_structure
    test $status = 0; or set status_color $color_error

    set -q __fish_git_prompt_showupstream
    or set -g __fish_git_prompt_showupstream auto

    # Função auxiliar para criar os segmentos do prompt
    function _prompt_wrapper
        set -l status_color $argv[1]
        set -l field_name $argv[2]
        set -l field_value $argv[3]

        set_color normal
        set_color $status_color
        echo -n '─'
        set_color -o $color_structure
        echo -n '['
        set_color normal
        
        if test -n "$field_name"
            set_color -o $color_secondary
            echo -n $field_name
            set_color normal
            echo -n ':'
        end
        
        # Usando o roxo vibrante para o valor do campo
        set_color --bold $color_vibrant_purple
        echo -n $field_value
        set_color -o $color_structure
        echo -n ']'
        set_color normal
    end

    # --- Linha Superior do Prompt ---
    set_color $status_color
    echo -n '┬─'
    set_color -o $color_structure
    echo -n '['

    # Usuário
    if functions -q fish_is_root_user; and fish_is_root_user
        set_color --bold $color_error # Destaque máximo para root
    else
        set_color -o $color_text # Usando o roxo vibrante
    end
    echo -n $USER

    # @
    set_color -o $color_structure
    echo -n '@'

    # Hostname
    if test -z "$SSH_CLIENT"
        set_color -o $color_text
    else
        set_color -o $color_secondary
    end
    echo -n (prompt_hostname)

    # Caminho (pwd)
    set_color -o $color_structure
    echo -n ':'
    set_color --bold $color_text
    echo -n (prompt_pwd)
    set_color -o $color_structure
    echo -n ']'

    # --- Segmentos Adicionais ---
    if functions -q fish_mode_prompt; fish_mode_prompt; end

    set -q VIRTUAL_ENV_DISABLE_PROMPT
    or set -g VIRTUAL_ENV_DISABLE_PROMPT true
    set -q VIRTUAL_ENV
    and _prompt_wrapper $status_color V (path basename "$VIRTUAL_ENV")

    set -l prompt_git (fish_git_prompt '%s')
    test -n "$prompt_git"
    and _prompt_wrapper $status_color G $prompt_git

    type -q acpi
    and acpi -a 2>/dev/null | string match -rq off
    and _prompt_wrapper $status_color B (acpi -b | cut -d' ' -f 4-)

    echo

    for job in (jobs)
        set_color $status_color
        echo -n '│ '
        set_color $color_secondary
        echo $job
    end

    # --- Linha Inferior do Prompt ---
    set_color $status_color
    echo -n '╰─'
    set_color -o $color_structure # Usando o roxo vibrante
    echo -n '$ '
    set_color normal
end

# Vi-Mode Indicator
function fish_mode_prompt
    # Paleta atualizada aqui também
    set -l color_vibrant_purple 'BE95FF'
    set -l color_secondary '6E6189'
    set -l color_text 'CBC9CC'
    
    if test "$fish_key_bindings" = "fish_vi_key_bindings"; or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        set -l mode
        switch $fish_bind_mode
            case default
                set mode (set_color --bold $color_secondary)N
            case insert
                set mode (set_color --bold $color_vibrant_purple)I
            case visual
                set mode (set_color --bold $color_vibrant_purple)V
            case '*'
                set mode (set_color --bold $color_text)R
        end
        set -l status_color '9C90AA'
        test $status = 0; or set status_color 'BE95FF'
        _prompt_wrapper $status_color '' "$mode"
    end
end
