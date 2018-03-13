set cursorline
syntax enable
set number
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set autoindent
set termguicolors
set laststatus=2
set statusline=[%n]\ 
set statusline+=%<%F\ 
set statusline+=%=\ 
set statusline+=line:%l/%L\ 
set statusline+=col:%c\ 
set statusline+=%p%%\ 
set statusline+=[%{strftime('%H:%M')}]
colorscheme OceanicNext
if (has('clipboard'))
    set clipboard=unnamedplus
endif
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=8
endif
