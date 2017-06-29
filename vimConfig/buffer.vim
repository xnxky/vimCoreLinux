"this is for buffer surf
"this is the default value, so it does not have
"to be set
"nnoremap <silent> <c-i> :BufSurfBack<CR>
"nnoremap <silent> <c-o> :BufSurfForward<CR>

noremap <silent> <C-p> :bp <cr>
noremap <silent> <C-n> :bn <cr>
noremap <silent> <C-f> :bf <cr>
noremap <silent> <C-e> :bl <cr>

" MiniBufExpl Colors
hi MBEVisibleActive guifg=#A6DB29 guibg=#000000
hi MBEVisibleChangedActive guifg=#F1266F guibg=#000000
hi MBEVisibleChanged guifg=#F1266F guibg=#000000
hi MBEVisibleNormal guifg=#5DC2D6 guibg=#000000
hi MBEChanged guifg=#CD5907 guibg=#000000
hi MBENormal guifg=#808080 guibg=#000000

"in buffergator window, <CR> and o,  <C-s> and i, <C-v> and s are equivalent
let g:buffergator_viewport_split_policy = 'B'"

nnoremap b1 :b1<cr>
nnoremap b2 :b2<cr>
nnoremap b3 :b3<cr>
nnoremap b4 :b4<cr>
nnoremap b5 :b5<cr>
nnoremap b6 :b6<cr>
nnoremap b7 :b7<cr>
nnoremap b8 :b8<cr>
nnoremap b9 :b9<cr>
