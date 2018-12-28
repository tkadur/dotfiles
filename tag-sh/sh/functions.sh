# load a module robustly by skipping all remaining modules if any module fails
# to load
load_module() {
    module="$1"
    if [ -f "$module" ]; then
        source $module

        if [ "$?" != "0" ]; then
            echo "Module $module failed to load"
            return
        fi
    fi
}

