function wsl_alias
    set command $argv[1]
    set command_wsl $command"_wsl"

    set COMMAND $command
    set COMMAND_WSL "cmd.exe /c "$command

    if begin; not type -q $command; and type -q "cmd.exe"; end
        set COMMAND $COMMAND_WSL
    end

    alias $command=$COMMAND
    alias $command_wsl=$COMMAND_WSL

    # We rely on this to make rlwrap-ing aliases work
    set -gx $command $COMMAND
end
