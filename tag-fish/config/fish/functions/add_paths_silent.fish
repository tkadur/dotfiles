# Add a list of directories to the PATH. If any don't exist, silently ignore.
function add_paths_silent
    set paths $argv
    for path in $paths
        if test -d $path
            set PATH $path $PATH
        end
    end
end
