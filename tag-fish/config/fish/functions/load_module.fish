# load a module robustly by skipping all remaining modules if any module fails
# to load
function load_module
    if test -n "$ABORTED"
        echo "We already aborted"
        return
    end

    set module "$argv[1]"
    if test -e "$module"
        source "$module"
        if test "$status" != "0"
            echo "Module $module failed to load. Exiting."
            set -x ABORTED 1
            return
        end
    else
        echo "Module $module does not exist. Exiting."
        set -x ABORTED 1
        return
    end
end
