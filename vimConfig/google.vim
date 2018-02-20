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

Glug piper plugin[mappings]=',ap'
Glug relatedfiles plugin[mappings]=',ar'

Glug g4

" not compatible, as browser is needed
" Glug corpweb plugin[mappings]='<leader>cs'

" very slow
Glug csearch
nnoremap <leader>cs :Csearch <C-R><C-W><CR><CR>

Glug add_usings plugin[mappings]
