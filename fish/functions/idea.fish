function idea
    # Check if argument is provided
    if test -n "$argv[1]"
        open -a "IntelliJ IDEA" "$argv[1]"
    else
        open -a "IntelliJ IDEA"
    end
end
