" Options
syntax on
set background=dark
set number
set expandtab
set softtabstop=8
set tabstop=8
set shiftwidth=8
set wildmenu
set wildmode=longest:full,full
set clipboard^=unnamedplus
set iskeyword-=-

" Maps
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzz
nnoremap N Nzz
nnoremap H ^ 
nnoremap L $ 

onoremap H ^ 
onoremap L $ 

vnoremap H ^ 
vnoremap L $ 

inoremap jj <ESC>

" Functions
function Gitbranch()
    return trim(system("git -C " . expand("%:h") . " branch --show-current 2>/dev/null"))
endfunction

augroup Gitget
    autocmd!
    autocmd BufEnter * let b:git_branch = Gitbranch()
augroup END

" Statusline
set ls=2
set statusline=%F%r
set statusline+=%#MatchParen#
set statusline+=\ 
set statusline+=%{b:git_branch}
set statusline+=\ 
set statusline+=%#StatusLine#
set statusline+=%=\[%02c\/%02l\/%L]

highlight MatchParen ctermbg=darkgrey
let base16colorspace=256
