alias re = refresh

layout src

shell [[ -f default ]]
if $_shell_exitcode == 0
        file default
end
