# Just calls wsl_alias on each element of a list
function wsl_aliases
    set cmds $argv
    for cmd in $cmds
        wsl_alias $cmd
    end
end
