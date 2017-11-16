" Need to use this to enable mouse
" function in vim
" However this might effect the double/triple
" click selects. And even copies
" Solution is to use SHIFT key as mod
" when using mouse
	" see
	" https://stackoverflow.com/questions/4608161/copy-text-out-of-vim-with-set-mouse-a-enabled
"	set mouse=a

"User mouse scrolling
map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>

"Vim split window movements
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Enable function names in status
"part of ctags.cvim plugin
"http://www.vim.org/scripts/script.php?script_id=610
let g:ctags_statusline=1 
let generate_tags=1

set rnu	
"Tag bar shows recently visited tags
"https://github.com/majutsushi/tagbar.git
nmap <F2> :TagbarToggle<CR>

"set textwidth=80
"

"this makes sure that bash loads its
".bashrc when running bash_scripts from vim
set shellcmdflag=-c

"set t_Co=256
" You complete me
let g:ycm_confirm_extra_conf = 0
let g:loaded_youcompleteme = 1 

"set line numbers
:set number

filetype plugin on
syntax on
filetype plugin indent on
set hlsearch
"yank till rest of the line
nnoremap Y y$
"nnoremap P vg_p

" this will paste recorded commands stored in q
nnoremap .. @q

" move the line down by one line in normal mode
"nnoremap _ ddp
" move the line up by one line in normal mode
"nnoremap + ddkP

" ctrl + s to save
" This also acts as a way to get out
" of insertmode.
" Two birds in one stone.
inoremap <c-a> <nop>
noremap <c-a> <nop>
nnoremap <c-a> :w<CR>
inoremap <c-a> <Esc>:w<CR>
nnoremap <c-g>g :echo expand('%:p')<CR>

"switch tabs
nnoremap <tab> gt

" ctrl + q to quit
:nnoremap <c-x> :q!<CR> 

"map key so that you can use it
"with combination with other keystrokes
let mapleader = "-"

"Adding comments
vnoremap <leader>cc :s/^/#/g<CR>
autocmd FileType c vnoremap <leader>cc :s/^/\/\//g<CR>

"drop down in to dir explorer
nnoremap <leader>se :Sex<CR>
nnoremap <leader><Up> <c-w>+<c-w>+<c-w>+<c-w>+<c-w>+<c-w>+<c-w>+<c-w>+<c-w>+
nnoremap <leader><Down> <c-w>-<c-w>-<c-w>-<c-w>-<c-w>-<c-w>-<c-w>-<c-w>-<c-w>-

"copy and into system clipboard
""Note: use vimxh
nnoremap <leader>y "*yy
nnoremap <leader>yiw "*yiw
nnoremap <leader>p "*p 
vnoremap <leader>y "*yy
vnoremap <leader>p "*p 

"edit my vimrc file on the go
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>ec :split ~/code/vim/vim_cmds<cr>

abbrev SAN /* SANNOTES: 
abbrev #i #include <><esc>i
abbrev csf cs find f
abbrev csc cs find c
abbrev csg cs find g
abbrev cse cs find e
"build
":set makeprg=~/scripts/remote_build
":set makeprg=~/scripts/remote_build_rand_t7
":set makeprg=~/scripts/m38
function! Build_remote()
	exe ":Make"
endfunction

function! Build_remote_rand2()
	:set makeprg=~/scripts/remote_build_rand2_t7
	exe ":Make"
endfunction

function! Run_checkpatch_custom()
	:set makeprg=~/scripts/checkpatch_vim
        let errorformat =
	    \ '%f:%l: %tARNING: %m,' .
	    \ '%f:%l: %tRROR: %m'

	exe ":Make"
endfunction
"Run check patch custom
nnoremap <leader>cp :call Run_checkpatch_custom()<cr>

function! Run_checkpatch_diff()
	:set makeprg=~/scripts/checkpatch_diff_vim
        let errorformat =
	    \ '%f:%l: %tARNING: %m,' .
	    \ '%f:%l: %tRROR: %m'

	exe ":Make"
endfunction
"Run check patch custom
nnoremap <leader>cd :call Run_checkpatch_diff()<cr>


nnoremap <leader>b2 :call Build_remote_rand2()<cr>

nnoremap <leader>rp :Dispatch rp49<cr>
nnoremap <leader>m :Make<cr>


"remove whitespace
nnoremap <leader>rw :%s/\s\+$//e<cr>


"cscope
"Split and find the defintiion
nmap <C-]><C-]> :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\><C-\>e :scs find e <C-R>=expand("<cword>")<CR><CR>

"print current date
nnoremap <leader>dp "=strftime("%c")<cr>P

function! Update_cscope()
	exe ":!scopeit_linux_cars && cscope -b"
	exe ":cs reset"
endfunction
nnoremap <leader>uc :call Update_cscope()<cr>

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
iabbrev p@ printk(KERN_INFO "=> (%s) line %d, file %s\n", __func__, __LINE__, __FILE__); 
iabbrev u@ printf("=> (%s) line %d, file %s\n", __func__, __LINE__, __FILE__); 
iabbrev for@ for (i = 0; i < ; i++) {<CR>}<esc>k15li
iabbrev i# #include
iabbrev if2 if () {<CR>}<esc>k4li
iabbrev if1 if ()<esc>F(a

iab <buffer> /// /**<cr><cr>/<up><right>

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>pf ^iprintf("<esc>$a\n");

"Delete the word and a space after it
"nnoremap <leader>w diwx

" Overwrite a read only file with sudo permissions
nnoremap <leader>w :w !sudo tee % > /dev/null<CR>

"delete reset of the chars till end of the line
"and replace it with ; -- use full in c
nnoremap <leader>; d$a;<esc>

:nnoremap <leader>d "=strftime("%c")<CR>P

"underline below
nnoremap <leader>- yyp<S-v>r-<Esc>
"move to front of the line
"nnoremap <c-h> ^
"vnoremap <c-h> ^

"move to end of the line
"nnoremap <c-l> $
"everyh
"vnoremap <c-l> $

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

nnoremap <leader>f $a( )<CR>{<CR><CR>}<esc>kkkf(a

augroup autocmds

"Autocmd's are re-read everytime you source the
"vimrc file and it doesnt get replaced, instead
"creates a new instance of the autocmd.
"Therefore we need to clear any previous mappings
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
"autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4
"autocmd FileType python nnoremap <buffer> <localleader>c I#<esc> 

" get rid of highlight
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

"c related settings
autocmd FileType c nnoremap <buffer> <localleader>c I//<esc> 
autocmd FileType c nnoremap <buffer> <localleader>m :call Ctemplate()<CR><esc>:23<CR> 
autocmd FileType c :iabbrev <buffer> iff if () {<CR>}<esc>k4li
autocmd FileType c :iabbrev <buffer> prin printf("");<esc>2hi 
autocmd FileType c :iabbrev <buffer> fori for (i = 0; i < ; i++) {<CR>}<esc>k15li
autocmd FileType c :iabbrev <buffer> forj for (j = 0; j < ; j++) {<CR>}<esc>k15li
autocmd FileType c :iabbrev <buffer> s@ struct
autocmd FileType c :iabbrev <buffer> d@ #define
autocmd FileType cpp :iabbrev <buffer> fori for (int i = 0; i < ; i++) {<CR>}<esc>k19li
autocmd FileType cpp :iabbrev <buffer> forj for (int j = 0; j < ; j++) {<CR>}<esc>k19li
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
set runtimepath^=~/.vim/bundle/ctrlp.vim

iab m// /*<CR><CR>/<esc>ka
iab s// /* */<esc>hi

"wrap in printf
"nnoremap <leader>p ^iprintf("<esc>A",);<esc>F)i
nnoremap 0p "*p 
nnoremap 0y "*y 

function! ToggleRelative()
	if (&rnu == 1)
		set nornu
	else
		set rnu	
	endif
endfunction

" Relative numbering
nnoremap <C-n>	:call ToggleRelative()<cr>

function! ToggleSyntax()
	if exists("g:syntax_on")
		syntax off
	else
		syntax enable
	endif
endfunction

nnoremap <leader>s  :call ToggleSyntax()<CR>
nnoremap <leader>ss :setlocal spell! spelllang=en_us<CR>

"space above and below the line in normal mode
nnoremap <leader>O O<esc>j  
nnoremap <leader>o o<esc>k  

"delete a function implementation
nnoremap <leader>df di{vkkddd 

"create a function definition above the current 
"function using the word under the curser in the
"current function
nnoremap <leader>cf yiw?^{<CR>kO<esc>pa()<CR>{<CR><CR>}<CR><esc>4kf(a  
nnoremap <leader>vcf yiw?^{<CR>kO<esc>ivoid <esc>pa()<CR>{<CR><CR>}<esc>2ko
nnoremap <leader>0 :split<cr>
nnoremap <leader>9 :vsplit<cr>

"declare a int variable the word under the cursor
nnoremap <leader>di mayiw?^{<CR>oint <esc>pa;<esc>'a
nnoremap <leader>dip mayiw?^{<CR>oint *<esc>pa;<esc>'a

" add a null check
" What the heck is this for ?
"nnoremap <leader>nu yiwo<CR>if (!<esc>pa)<CR>return

"Go to the next error in Quickfix window
nnoremap <leader>n :cn<cr>


" By default vim treats all numbers are octal. use this to treat it as
" decimals
"set nrformats=

" Switch between buffers
nnoremap <silent>  [b :bprevious<CR>
nnoremap <silent>  ]b :bnext<CR>
nnoremap <silent>  ]B :bfirst<CR>
nnoremap <silent>  [B :blast<CR>
"set paste
"set nopaste

" File path expansions relative to the active buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"auto indent
:set autoindent
:set cindent

"Taglist mappings
nnoremap tt :TlistToggle<CR>
let Tlist_Show_One_File = 1

function! Vim_custom_search_dir(dir)
  let l:curline = getline('.')
  call inputsave()
  let l:name = input('Enter name: ')
  call inputrestore()
  exe ":vim " .l:name. " %:p:h/".a:dir."**/* | cw"
endfunction

" ALWAYS use let to access variables
function! Gitgrep_custom_search_dir(dir, fp, cust_dir, name)
	let l:cur_dir=a:dir
	let l:cur_fp=a:fp
	let l:sword = a:name

	if empty(a:name)
		"FIXME
		"let l:vselect_word = Get_visual_selection()
		let l:vselect_word = ""
		if empty(l:vselect_word)
			let l:sword = Get_user_inputs('Search string: ')
		else
			let l:sword = l:vselect_word
		endif
	endif

	echom "Searching ".l:sword
	if a:cust_dir == 1
         	let l:cur_dir= Get_user_inputs('DirectoryPath: ')
		let l:cur_fp=1
	endif

	if cur_fp == 1
		exe ":Ggrep " .l:sword. " " .cur_dir
	else
		exe ":Ggrep " .l:sword. " %:p:h/".cur_dir
	endif
endfunction

function! Get_user_inputs(text)
  call inputsave()
  let uinput = input(a:text)
  call inputrestore()
  return l:uinput
endfunction

function! Get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction


nnoremap <leader>sc :call Gitgrep_custom_search_dir("", 0, 0, "")<CR>
nnoremap <leader>scc :call Gitgrep_custom_search_dir("", 0, 1, "")<CR>
nnoremap <leader>sc1 :call Gitgrep_custom_search_dir("../", 0, 0, "")<CR>
nnoremap <leader>sc2 :call Gitgrep_custom_search_dir("../../", 0, 0, "")<CR>
nnoremap <leader>sc3 :call Gitgrep_custom_search_dir("../../../", 0, 0, "")<CR>
nnoremap <leader>scd :call Gitgrep_custom_search_dir("drivers/", 1, 0, "")<CR>
"Search word under cursor in current file dir
nnoremap <leader>sw :call Gitgrep_custom_search_dir("", 0, 0, expand("<cword>"))<CR>
nnoremap <leader>sw1 :call Gitgrep_custom_search_dir("../", 0, 0, expand("<cword>"))<CR>
nnoremap <leader>sw2 :call Gitgrep_custom_search_dir("../../", 0, 1, expand("<cword>"))<CR>
nnoremap <leader>sw3 :call Gitgrep_custom_search_dir("../../../", 0, 1, expand("<cword>"))<CR>
vnoremap <leader>sw :call Gitgrep_custom_search_dir("", 0, 0, expand("<cword>"))<CR>
vnoremap <leader>sw1 :call Gitgrep_custom_search_dir("../", 0, 0, expand("<cword>"))<CR>
vnoremap <leader>sw2 :call Gitgrep_custom_search_dir("../../", 0, 1, expand("<cword>"))<CR>
vnoremap <leader>sw3 :call Gitgrep_custom_search_dir("../../../", 0, 1, expand("<cword>"))<CR>



"cycle buffer
nnoremap <leader>t :bprevious<CR>
nnoremap <leader>] :bnext<CR>
nnoremap <leader>ee :e <C-R>=expand("%:p:h")<CR><CR>

"Jump to variable type definition
nnoremap <leader>fd magdBB<c-]>


autocmd QuickFixCmdPost *grep* cwindow

"cscope shortcuts
nnoremap <leader>f :cs find f 
nnoremap <leader>g :cs find g 

"replace : with 11
"nnoremap 11 :
nnoremap <leader>kf :sp <C-R>=expand("%:p:h")."/Kconfig"<CR><CR>
nnoremap <leader>mf :sp <C-R>=expand("%:p:h")."/Makefile"<CR><CR>
"tab shotcuts 
nnoremap <leader>to :tabe %<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tn :tabn<cr>
nnoremap <leader>tp :tabp<cr>

nnoremap <leader><tab> :cnext<cr>
"jump to the function
nnoremap <leader>jf ?^{<cr>kw	

nnoremap <leader>mt :Dispatch make_trace<cr> 
nnoremap <leader>mr :Dispatch make_rds<cr> 
"set autochdir
"c template stuff
nnoremap <leader>ct :read ~/.vim/templates/std.c<cr>


"Current line to the top of the screen
"z<CR>
"Scroll one line down
"<C-y>
"Scroll one line up
"<C-e>
"Replace in all windows/buffers
":bufdo %s/pattern/replace/ge | update
"Surround with something
"ysiw<something>
"Matching and stroing in variable
" .s/(\([0-9]*\))/{\1}/
" bufdo! execute 'norm @q' | update
" argdo! execute 'norm @q' | update
" "
" To paste yanked buffer to commandline 
" Ctr-R and then "
