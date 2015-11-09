function prompt_haskell() {
    cabal_files=(*.cabal(N))
    if [ $#cabal_files -gt 0 ]; then
        if [ -f cabal.sandbox.config ]; then
            cabal_sandbox_info $1
        elif [ -f stack.yaml ]; then
            stack_info $1
        else
            $1_prompt_segment red $DEFAULT_COLOR "no stack/sandbox"
        fi
    fi
}

function stack_info() {
    ghc_version=`ghc --version | rev | cut -d' ' -f 1 | rev`
    resolver_yaml=`cat stack.yaml | grep resolver | cut -d' ' -f 2`
    if [ -d ".stack-work/install/x86_64-linux/$resolver_yaml" ]; then
        ghc_stack=`ls .stack-work/install/x86_64-linux/$resolver_yaml/ | grep $ghc_version`
        $1_prompt_segment green $DEFAULT_COLOR $resolver_yaml
        if [ $ghc_stack ]; then
            $1_prompt_segment green $DEFAULT_COLOR $ghc_version
            #echo "[%{$fg[green]%}$resolver_yaml %{$reset_color%}| %{$fg[green]%}$ghc_version%{$reset_color%}]"
        else
            ghc_stack=`ls .stack-work/install/x86_64-linux/$resolver_yaml/ | xargs`
            $1_prompt_segment red $DEFAULT_COLOR $ghc_stack
            #echo  "[%{$fg[green]%}$resolver_yaml%{$reset_color%}|%{$fg[red]%}$ghc_stack%{$reset_color%}]"
        fi
    else
        $1_prompt_segment red $DEFAULT_COLOR "$resolver_yaml missing"
        #echo  "%{$fg[red]%}[$resolver_yaml missing please do a 'stack build']%{$reset_color%}"
    fi
}

function cabal_sandbox_info() {
    ghc_version=`ghc --version | rev | cut -d' ' -f 1 | rev`
    ghc_loc=`ls .cabal-sandbox | grep ghc | cut -d'-' -f 4 | grep $ghc_version`
    if [ $ghc_loc ]; then
        $1_prompt_segment green $DEFAULT_COLOR $ghc_version
        #echo "[%{$fg[green]%}$ghc_version%{$reset_color%}]"
    else
        ghc_version=`ls .cabal-sandbox | grep ghc | cut -d'-' -f 4 | xargs`
        $1_prompt_segment red $ghc_version
        #echo  "[%{$fg[red]%}$ghc_version%{$reset_color%}]"
    fi
}
