# Add a list of directories to the PATH. If any don't exist, report an error
function add_paths_silent
    set paths "$argv"
    for path in path
        if test -d "$path"
            set PATH "$path" $PATH
        else
            echo "$path not found! Aborting..."
            exit 1
        end
    end
end
