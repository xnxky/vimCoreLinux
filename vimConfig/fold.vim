"Folding Option, if noremap is used, this one won't work
set foldmethod=syntax
let html_dynamic_folds=1
"let html_number_lines=0
"unlet html_number_lines
let html_use_css=1
"let html_ignore_folding=1
noremap zy zfa}
noremap zz za
"the followng has problem for locationlist, quickfixlist and temp buffer
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview
highlight FoldColumn guibg=Grey25 guifg=#0088FF ctermfg=White ctermbg=DarkBlue term=standout

nnoremap <leader>y :set foldmethod=syntax \| set foldtext=foldtext()<cr>

"or nnoremap <leader>t :set foldmethod=syntax <bar> set foldtext=foldtext()<cr>
"based on this
"https://stackoverflow.com/questions/23204110/mapping-one-key-to-multiple-commands-in-vim

