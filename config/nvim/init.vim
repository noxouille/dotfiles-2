set cursorline
syntax enable
set number
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set autoindent
"set termguicolors
set laststatus=2
set statusline=[%n]\ 
set statusline+=%<%F\ 
set statusline+=%=\ 
set statusline+=line:%l/%L\ 
set statusline+=col:%c\ 
set statusline+=%p%%\ 
set statusline+=[%{strftime('%H:%M')}]
set background=dark
colorscheme base16-material

if (has('clipboard'))
    set clipboard+=unnamedplus
endif
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=8
endif

call plug#begin('~/.local/share/nvim/plugs')
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'w0rp/ale'
Plug 'roxma/ncm-clang'
Plug 'roxma/nvim-completion-manager'

Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
call plug#end()
let g:indent_guides_enable_on_vim_startup = 1
let g:ale_sign_column_always = 1
