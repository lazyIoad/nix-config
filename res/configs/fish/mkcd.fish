function mkcd --description="Make a directory and enter it"
    mkdir -p $argv[1]; and cd $argv[1]
end
