" LaTeX filetype plugin
" Language:     LaTeX (ft=tex)
" Maintainer:   Srinath Avadhanula
" Email:        srinath@eecs.berkeley.edu
" URL:          http://vim.sourceforge.net/scripts/script.php?script_id=93
" Last Change:  2001 Dec 7
"
" Help: 
" This file type plugin intended for use with vim 6.0+ provides some insert
" mode macros for the LaTeX typesetting language. The nice thing about these
" mappings is that they emulate the operator pending mode in the insert mode.
" i.e, the user does NOT have to type the LHS in a hurry or without making
" mistakes. This facilitates using the macros greatly.
"
" See the URL above for the detailed list of macros provided or just browe
" this file. In brief, this file provides stubs for the most commonly used
" typsetting commands such as figures, matrices etc. As an example, the
" commonly used matrix element is provided. Typing
"
" mat<tab>
" 
" in the insert mode will expand to the following
" 
" \left[
" \begin{array}{_}
" \end{array}
" \right]
" 
" with the cursor placed where the underscore is shown (note the underscore is
" not part of the macro, it just shows the cursor placement)
" NOTE: <tab> is part of the LHS of the mapping. however, the characters need
"       NOT be typed in quick succession as in most insert mode commands.
"
" See the section "ADDING" below in order to modify/add new mappings.
" 
" A quick way to enter greek symbols is also provided. For example, 
" typing '\q<tab>' will expand to \theta. (NOTE: quotes are not part of the
" LHS). See the section "SYMBOLS" towards the end for adding/modifying the way
" the greek alphabet is mapped into the english alphabet.
"
" Changes:
" 2001 Dec 7: 1. changed things so that most mappings emulate the operator
"                pending mode. this greatly facilitates typing by not
"                requiring the LHS to be typed quickly. one can infact type
"                the LHS (without the <tab>), roam around in the file, come
"                back to the end of the file, press <tab> and still have the
"                LHS expand properly!
"              2. planning a second release for this.

if exists("b:didLocalTex")
	finish	
end
let b:didLocalTex = 1

let s:save_cpo = &cpo
set cpo&vim

exec "setlocal isk=".&isk.",:"

imap <buffer> FRAC \frac{}{}hhi
inoremap <buffer> _ _{}i
inoremap <buffer> ^ ^{}i
inoremap <buffer> $$ $$i
inoremap <buffer> == &=&

nmap <buffer> >L :LATEX<cr>


" --------------------------------------------------------------------------- 
"                  begin user customizable mode
" --------------------------------------------------------------------------- 
" ADDING:   adding new macros
"
" to add new insert mode macros, first type in the RHS of the required mapping
" as a string and assign a variable which matches the LHS of the mapping to
" it. In other words, if you want to add the mapping
"
" imap deg<tab> ^\circ
"
" then add the following line:
"
" let g:deg = '^\circ'
"
" NOTE: use single quotes to define the variables not double quotes.
"
" also add the word deg to the g:macros variable. In this case, the g:macros
" variable should then look like:
"
" g:macros = "\<\(...\|ddot\|deg\)\>
"
" with this done, pressing <tab> after typing deg will expand to ^\circ
"
let g:tab  = '\begin{table}\centering\begin{tabular}{}\end{tabular}\label{tab:}\caption{}\end{table}kkkkk$i' 
let g:bar  = '\left\begin{array}{}\end{array}\rightkkk$i'
let g:ben  = '\begin{enumerate}\item \end{enumerate}kA'
let g:bit  = '\begin{itemize}\item \end{itemize}kA'
let g:beq  = '\begin{equation}\end{equation}O'
let g:bqn  = '\begin{eqnarray}\end{eqnarray}O'
let g:bfg  = '\begin{figure}[h]\centerline{\psfig{figure=.eps}}\caption{}\label{fig:}\end{figure}kkk$hhhhhi'
let g:bfe  = '\begin{figure}\vspace{}\caption{}\end{figure}kk$i'
let g:btb  = '\begin{tabular}{}\end{tabular}ki'
let g:bta  = '\begin{table}\centering\begin{tabular}{}\end{tabular}\label{tab:}\caption{}\end{table}kkkkk$i'
let g:pic  = '\begin{picture}(4,4)\put(0.5,0){\framebox(4,4){}}\end{picture}k$hi'
let g:mat  = '\left[\begin{array}{}\end{array}\right]kk$i'
let g:frac = ' \frac{}{}hhi'
let g:dot  = '\dot{}i'
let g:ddot = '\ddot{}i'

let g:macros = '\<\(tab\|bar\|ben\|bit\|beq\|bqn\|bfg\|bfe\|btb\|bta\|pic\|mat\|frac\|dot\|ddot\)\>'

imap <buffer> <tab> <c-r>=TeXTabWrapper()<cr>


" SYMBOLS:          adding/modifying greek symbols
" modify this function if you want to change the way you enter the greek
" alphabet.
function! GetGreekChar(char)
	if     a:char ==  "a" | return "\<bs>alpha"
	elseif a:char ==  "b" | return "\<bs>beta"
	elseif a:char ==  "c" | return "\<bs>chi"
	elseif a:char ==  "d" | return "\<bs>delta"
	elseif a:char ==  "e" | return "\<bs>epsilon"
	elseif a:char ==  "f" | return "\<bs>phi"
	elseif a:char ==  "g" | return "\<bs>gamma"
	elseif a:char ==  "h" | return "\<bs>eta"
	elseif a:char ==  "k" | return "\<bs>kappa"
	elseif a:char ==  "l" | return "\<bs>lambda"
	elseif a:char ==  "m" | return "\<bs>mu"
	elseif a:char ==  "n" | return "\<bs>nu"
	elseif a:char ==  "p" | return "\<bs>pi"
	elseif a:char ==  "q" | return "\<bs>theta"
	elseif a:char ==  "r" | return "\<bs>rho"
	elseif a:char ==  "s" | return "\<bs>sigma"
	elseif a:char ==  "t" | return "\<bs>tau"
	elseif a:char ==  "u" | return "\<bs>upsilon"
	elseif a:char ==  "v" | return "\<bs>varsigma"
	elseif a:char ==  "w" | return "\<bs>omega"
	elseif a:char ==  "x" | return "\<bs>xi"
	elseif a:char ==  "y" | return "\<bs>psi"
	elseif a:char ==  "z" | return "\<bs>zeta"
	elseif a:char ==  "A" | return "\<bs>Alpha"
	elseif a:char ==  "B" | return "\<bs>Beta"
	elseif a:char ==  "C" | return "\<bs>Chi"
	elseif a:char ==  "D" | return "\<bs>Delta"
	elseif a:char ==  "E" | return "\<bs>Epsilon"
	elseif a:char ==  "F" | return "\<bs>Phi"
	elseif a:char ==  "G" | return "\<bs>Gamma"
	elseif a:char ==  "H" | return "\<bs>Eta"
	elseif a:char ==  "K" | return "\<bs>Kappa"
	elseif a:char ==  "L" | return "\<bs>Lambda"
	elseif a:char ==  "M" | return "\<bs>Mu"
	elseif a:char ==  "N" | return "\<bs>Nu"
	elseif a:char ==  "P" | return "\<bs>Pi"
	elseif a:char ==  "Q" | return "\<bs>Theta"
	elseif a:char ==  "R" | return "\<bs>Rho"
	elseif a:char ==  "S" | return "\<bs>Sigma"
	elseif a:char ==  "T" | return "\<bs>Tau"
	elseif a:char ==  "U" | return "\<bs>Upsilon"
	elseif a:char ==  "V" | return "\<bs>Varsigma"
	elseif a:char ==  "W" | return "\<bs>Omega"
	elseif a:char ==  "X" | return "\<bs>Xi"
	elseif a:char ==  "Y" | return "\<bs>Psi"
	elseif a:char ==  "Z" | return "\<bs>Zeta"
	endif
endfunction
" --------------------------------------------------------------------------- 
"         end user customizable portion for macros
" --------------------------------------------------------------------------- 

function! TeXTabWrapper()
    let col = col('.') - 1
	" first if the <tab> is pressed at the beginning of a line or there is no
	" keyword before it, just return <tab>
	if !col || getline('.')[col - 1] !~ '\k'
		call PrintError('returning tab')
        return "\<tab>"
    end

	let macro = ProcessStub()
	" if user presses <tab> after entering strings like '\q'
	" then its a tex symbol (in this case \theta)
	if (col - 1) > 0 && getline('.')[col - 2] == '\'
		call PrintError('falling here returning symbol')
		return GetGreekChar(getline('.')[col - 1])
	" if not, then attempt to complete it as a tex macro
	elseif macro != '0'
		call PrintError('falling here returning macro')
		normal vbx`
		return macro
	" if its not a macro and InsertTabWrapper exists, then give over control
	" to that function.
	elseif exists('*InsertTabWrapper')
		call PrintError('falling here returning overall tab wrapper')
		return InsertTabWrapper("forward")
	" not a symbol or macro and InsertTabWrapper not there, return <tab>
	" again.
	else
		call PrintError('nothing returning')
		return "\<tab>"
	end
endfunction

" this function provides a way to make the mappings such as the following
" 
" imap bfe<tab> something
"
" emulate the operator pending mode. i.e, it is not necessary to enter the
" keys b,f,e,<tab> in quick succession. this works by just mapping the last
" character, which is chosen to be <tab> instead of all the characters. 
" a check is then made to see if the characters entered before match the total
" LHS of the required mapping.
function! ProcessStub()
	let column = col('.')-1
	let word = ''
	let character = '`'
	while column > 0 && character !~ '\s'
		let character = getline('.')[column-1]
		let word = character.word
		let column = column - 1
		call PrintError('column = '.column.', character = '.character)
	endwhile
	call PrintError('word = '.word)
	if word =~ g:macros
		exe 'return g:'.word
	else
		call PrintError('returning 0')
		return '0'
	end
endfunction
