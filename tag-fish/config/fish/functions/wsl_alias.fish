function wsl_alias
    set command $argv[1]
    # set wrapper $argv[2]

    set COMMAND $command
    if not type -q $command
        if type -q "cmd.exe"
            set COMMAND "cmd.exe /c "$command
        end
    end

    # if test $wrapper
    alias $command=$COMMAND
    set -gx $command"_wsl" $COMMAND
end
