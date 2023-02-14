if &compatible
  set nocompatible " Be iMproved
endif

" Required:
" Add the dein installation directory into runtimepath
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo
set runtimepath+=~/.vim/bundles/repos/github.com/junegunn/fzf

let $CACHE = expand('~/.vim/bundles')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE . '/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

" Required:
call dein#begin('~/.vim/bundles')

" Let dein manage dein
call dein#add('~/.vim/bundles')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" Git related
call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-fugitive')

" Autocomplete related
call dein#add('folke/lsp-colors.nvim')
call dein#add('hrsh7th/cmp-buffer')
call dein#add('hrsh7th/cmp-cmdline')
call dein#add('hrsh7th/cmp-nvim-lsp')
call dein#add('hrsh7th/cmp-path')
call dein#add('hrsh7th/nvim-cmp')
call dein#add('L3MON4D3/LuaSnip')
call dein#add('neovim/nvim-lspconfig')
call dein#add('onsails/lspkind.nvim')
call dein#add('ray-x/lsp_signature.nvim')
call dein#add('saadparwaiz1/cmp_luasnip')
call dein#add('simrat39/symbols-outline.nvim')

" Grep related
call dein#add('junegunn/fzf', { 'do': { -> fzf#install() } }) 
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

" Formatting related
call dein#add('lukas-reineke/indent-blankline.nvim')
call dein#add('tpope/vim-surround')

" File explorer
call dein#add('kyazdani42/nvim-web-devicons')
call dein#add('kyazdani42/nvim-tree.lua')

" Syntax related
call dein#add('jubnzv/virtual-types.nvim')
call dein#add('MaxMEllon/vim-jsx-pretty')
call dein#add('pangloss/vim-javascript')
call dein#add('plasticboy/vim-markdown')
call dein#add('typescript-language-server/typescript-language-server')

" Micellaneous
call dein#add('Pocco81/TrueZen.nvim')
call dein#add('vim-airline/vim-airline')
" call dein#add('vimwiki/vimwiki')

" Colorschemes
call dein#add('ayu-theme/ayu-vim')
call dein#add('catppuccin/nvim')
call dein#add('cocopon/iceberg.vim')
call dein#add('fenetikm/falcon')
call dein#add('ghifarit53/tokyonight-vim')
call dein#add('lifepillar/vim-solarized8')
call dein#add('morhetz/gruvbox')
call dein#add('nanotech/jellybeans.vim')
call dein#add('rebelot/kanagawa.nvim')
call dein#add('sainnhe/edge')
call dein#add('t184256/vim-boring')

" Required:
call dein#end()

" If you want to install not installed plugins on startup.
"if dein#check_install()
" call dein#install()
"endif

" Required:
set encoding=utf-8
set t_Co=256
set termguicolors
set bg=dark
filetype plugin indent on
syntax enable
colorscheme catppuccin-mocha

" Custom Mappings
imap jj <Esc>
let mapleader="'"

" Colorscheme tweak
" hi pythonFunction guifg=#d2a8ff
" hi pythonFunction guifg=#b875ff
" hi clear pythonComment

" Set absolute and relative line numbers
set nu rnu
" Convert tab to spaces
set expandtab
" Set tab to 2 spaces
set tabstop=2
" Set indent space to 2
set shiftwidth=2
" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Markdown
au BufRead,BufNewFile *.md setlocal textwidth=80

" Python
au BufRead,BufNewFile *.py setlocal textwidth=88

" Python/PHP tabwidth
autocmd FileType python,php setlocal shiftwidth=4 tabstop=4 expandtab

" vimwiki
" let g:vimwiki_global_ext = 0
" let g:vimwiki_list=[{ 'path' : '$HOME/app',
"   \ 'syntax' : 'markdown', 'ext' : '.md' }]

" Indent blank line
lua require('indent-blankline')

" LSP config
lua require('lsp-config')
lua require('lsp-cmp')
lua require('diagnostics')

" Nvim tree
lua require('nvim_tree')
nnoremap <C-n> :NvimTreeToggle

" Check syntax group
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
