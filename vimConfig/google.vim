Glug codefmt
Glug codefmt-google
augroup autoformat_settings
""autocmd FileType borg,gcl,patchpanel AutoFormatBuffer gclfmt
autocmd FileType bzl AutoFormatBuffer buildifier
""autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
autocmd FileType dart AutoFormatBuffer dartfmt
autocmd FileType java AutoFormatBuffer google-java-format
autocmd FileType jslayout AutoFormatBuffer jslfmt
autocmd FileType go AutoFormatBuffer gofmt
""autocmd FileType python AutoFormatBuffer pyformat
autocmd FileType markdown AutoFormatBuffer mdformat
autocmd FileType ncl AutoFormatBuffer nclfmt
augroup END

nnoremap <leader>m :call FormatAroundCurrentLines(0)<CR>
nnoremap <leader>m1 :call FormatAroundCurrentLines(1)<CR>
nnoremap <leader>m2 :call FormatAroundCurrentLines(2)<CR>
nnoremap <leader>m3 :call FormatAroundCurrentLines(3)<CR>
nnoremap <leader>m4 :call FormatAroundCurrentLines(4)<CR>
nnoremap <leader>m5 :call FormatAroundCurrentLines(5)<CR>
nnoremap <leader>m6 :call FormatAroundCurrentLines(6)<CR>
nnoremap <leader>m7 :call FormatAroundCurrentLines(7)<CR>
nnoremap <leader>m8 :call FormatAroundCurrentLines(8)<CR>
nnoremap <leader>m9 :call FormatAroundCurrentLines(9)<CR>
"" pipe mapping, needed for "<leader>apf" to work
"" can not use "<leader>p", which is for files search.
Glug piper plugin[mappings]='<leader>ap'
Glug relatedfiles plugin[mappings]='<leader>ar'

Glug g4

" not compatible, as browser is needed
" Glug corpweb plugin[mappings]='<leader>cs'

" very slow Glug csearch
nnoremap <leader>cs :Csearch <C-R><C-W><CR><CR>

"" not work in visual mode as my "," is used for something else.
"" just use FormatLines instead, like `:12, 30 FormatLines`, much easier.
""nnoremap <leader>a :FormatLines<CR>

Glug add_usings plugin[mappings]

function! FormatAroundCurrentLines(num)
  let startLine = line('.') - a:num
  let endline = line('.') + a:num
  execute startLine . ',' . endline . 'FormatLines'
endfunction
