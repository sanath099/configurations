nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
:set number
filetype plugin on
execute pathogen#infect()
syntax on
filetype plugin indent on
set hlsearch

" move the line down by one line in normal mode
"nnoremap _ ddp
" move the line up by one line in normal mode
"nnoremap + ddkP

" ctrl + s to save
" This also acts as a way to get out
" of insertmode.
" Two birds in one stone.
inoremap <c-a> <nop>
nnoremap <c-a> :w<CR>
inoremap <c-a> <Esc>:w<CR>

" ctrl + q to quit
:nnoremap <c-x> :q!<CR> 

"map key so that you can use it
"with combination with other keystrokes
let mapleader = "-"

"edit my vimrc file on the go
nnoremap <leader>ev :split $MYVIMRC<cr>

"source my vimrc file on the go
nnoremap <leader>sv :source $MYVIMRC<cr>

"use of abbreviations in insert mode
"usefull for typos 
"Yes, you could use mappings
"but with mapping
"ladn will be land, not so in abbrev
iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev p@ printf("=> (%s) line %d, file %s\n", __func__, __LINE__, __FILE__); 
iabbrev i# #include
iabbrev if2 if () {<CR>}<esc>k4li
iabbrev if1 if ()<esc>F(a

iab <buffer> /// /**<cr><cr>/<up><right>

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
"nnoremap <leader>f ^iprintf("<esc>f|cl", <esc>:s/|/, /g$a);<esc>

"Delete the word and a space after it
nnoremap <leader>w diwx

"delete reset of the chars till end of the line
"and replace it with ; -- use full in c
nnoremap <leader>; d$a;<esc>

"move to front of the line
nnoremap H ^
vnoremap H ^

"move to end of the line
nnoremap L $
vnoremap L $

inoremap jk <esc>

"diable this so that you can learn
"the new esc command
inoremap <c-c> <nop>

"example of function calling 
"and reading from a file
function! Ctemplate()
	r~/vim/c/default.c
endfunction

function! Mf()
	let some = split(@")
python << EOF
import vim
s = vim.current.line 
vim.command("let sm = '%s'" % s)
EOF
	echom sm
endfunction

function! Cgaurd()
	let l:fname = expand("%:t")
	let l:fname = substitute(l:fname, '\.', '_', 'g')
	let l:gname = toupper(l:fname)
	let l:fname =  "#ifndef " . l:gname 
	execute "normal" 'ggO'
	"put is the command to write a
	"output of a variable to buffer
	execute "put = '" . fname . "'" 
	execute "normal" 'ggdd'
	let l:fname =  "#define " . l:gname 
	execute "put = '" . fname . "'" 
	execute "normal" 'G'
	execute "put = '#endif'"
endfunction

nnoremap <leader>g :call Cgaurd()<CR>

"Convert the current word into a function definition
nnoremap <leader>f $a( )<CR>{<CR><CR>}<esc>kkkf(a

augroup autocmds
"auto cmds are reread everytime you source the
"vimrc file and it doesnt get replaced, instead
"creates a new instance of the autocmd
"therefore we need to clear any previous mappings
"using autocmd!
autocmd!
" autocmd is event based command
" below when a new file with the 
" extension of .c is opened it displays the message inside
" echo
"autocmd BufNewFile *.c echo "you opened a new c file"

"This event is checked before writing the file 
autocmd BufWritePre *.html :normal gg=G

"python related settings
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4
autocmd FileType python nnoremap <buffer> <localleader>c I#<esc> 


"c related settings
autocmd FileType c nnoremap <buffer> <localleader>c I//<esc> 
autocmd FileType c nnoremap <buffer> <localleader>m :call Ctemplate()<CR><esc>:23<CR> 
autocmd FileType c :iabbrev <buffer> iff if () {<CR>}<esc>k4li
autocmd FileType c :iabbrev <buffer> prin printf("");<esc>2hi 
autocmd FileType c :iabbrev <buffer> fori for (i = 0; i < ; i++) {<CR>}<esc>k15li
autocmd FileType c :iabbrev <buffer> s@ struct
autocmd FileType c :iabbrev <buffer> d@ #define
"autocmd FileType c :iabbrev <buffer> { {<CR><CR>}<esc>ki<tab><up> 
augroup END

"operator mapping
"di( is delete inside parens
"delete -> operator
"inside parens -> movement
"You can just map movements to a key 
"this is called operator pending mappings

" mapping for 'inside parens' 
onoremap p i(

" what if we are not in parenthses
onoremap in( :<c-u>normal! f(vi(<cr>
