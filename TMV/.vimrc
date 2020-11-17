let mapleader ='\'

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif


set bg=dark
set go=a
set mouse=a
set nohlsearch
set clipboard=unnamedplus

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vimling:
	nm <leader>d :call ToggleDeadKeys()<CR>
	imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
	nm <leader>i :call ToggleIPA()<CR>
	imap <leader>i <esc>:call ToggleIPA()<CR>a
	nm <leader>q :call ToggleProse()<CR>

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck %<CR>

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/repos/writings', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
	vnoremap <C-c> "+y
	map <C-p> "+P

" Enable Goyo by default for mutt writting
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost *bmdirs,*bmfiles !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd


	call plug#begin('~/.vim/plugged')
	Plug 'artur-shaik/vim-javacomplete2'
	call plug#end()

	colorscheme delek

" Java autocompletion
	autocmd FileType java setlocal omnifunc=javacomplete#Complete
	nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
	imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
	nmap <F5> <Plug>(JavaComplete-Imports-Add)
	imap <F5> <Plug>(JavaComplete-Imports-Add)
	nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
	imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
	nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
	imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

	nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
	nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
	nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
	nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

	imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
	imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
	imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
	imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

	nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

	imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

	nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
	nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
	nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
	nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
	nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
	nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
	nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
	nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

	imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
	imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
	imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

	vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
	vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
	vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

	nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
	nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)
