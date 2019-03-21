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
"" pipe mapping, needed for "<leader>clf" to work
"" can not use "<leader>p", which is for files search.
Glug piper plugin[mappings]='<leader>cl'
Glug relatedfiles plugin[mappings]='<leader>rf'

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



" FormatChanges(Alpha)
" ====
" FormatChanges helps editting legacy code or manually formatted, without
" visually select changed lines and call `:FormatLines` all the times when using
" `codefmt` plugin.
" It reads changes info from plugin `vim-signify` which actually
" comes from `git`, `hg`, `p4`, etc. Then call `codefmt` to format changes.
"
" Prerequisites
" ----
" Plug 'mhinz/vim-signify'
" Glug codefmt
" Glug codefmt-google
"
" USAGE
" ----
" Call `:FormatChanges` or bind key to it when signs from vim-signfy is updated.
"
" Or use the autocmd to auto format changed lines when saving. Auto formatting
" works fine for me with `git5` and `fig`, but since `g4 diff` usually takes
" about 1 sec from my test, call `:FormatChanges` directly is recommended when
" using `g4`.
" Call `:NoAutoFormatChanges` to temporary disable auto formatting for current
" buffer.
"
" Known Issues
" ----
" - When adding new files, vim-signfy sometimes can't get current diff to give
"   current signs, so it can't work.
" - If signs from vim-signfy are overrided by other plugins, it failed
"   sometimes.
" ====
" Customize Config
" ====
" Optional key binding
nnoremap <leader>f :FormatChanges<CR>
" Sometime still want to diable auto formatting and format selected lines.
vnoremap <leader>f :FormatLines<CR>
" Synchronic waiting for signfy timeout (ms),
" g4 is much slower than git5 and fig when calling signfy.
let g:auto_format_changed_lines_signfy_timeout = 2000 " default 500
augroup formatchanges
  autocmd!
  " Only file types with range format support are available,
  " like bzl, gcl are not supported, we could use codefmt directly.
  autocmd FileType c,cpp call AutoFormatChanges()
  autocmd FileType java call AutoFormatChanges()
  autocmd FileType proto call AutoFormatChanges()
  autocmd FileType javascript call AutoFormatChanges()
  autocmd FileType borg call AutoFormatChanges()
  autocmd FileType python call AutoFormatChanges()
  autocmd FileType markdown call AutoFormatChanges()
  autocmd BufWritePre * call AutoFormatChangesIfEnable()
augroup END
" ====
" Functions
" ====
function! FormatChanges()
  call sy#sign#get_current_signs(b:sy)
  " The list is reversed to make sure line numbers will not change during
  " multi-times formatting.
  for l:hunk in reverse(b:sy.hunks)
    let l:deletedonly = 1
    for l:lnum in range(l:hunk['start'], l:hunk['end'])
      if exists("b:sy.internal[l:lnum].type")
        if b:sy.internal[l:lnum].type !~ "^SignifyDelete"
          let l:deletedonly = 0
        endif
      endif
    endfor
    " Not formatting deleted only changes hunk.
    if !l:deletedonly
      call codefmt#FormatLines(l:hunk['start'], l:hunk['end'])
    endif
  endfor
endfunction
function! AutoFormatChangesIfEnable()
  if !exists("b:sy.vcs[0]") " File not in vcs
    return
  endif
  if get(b:, "is_formatting_changed_lines", 0)
    return
  endif
  if !get(b:, 'auto_format_changed_lines', 0)
    return
  endif
  let b:is_formatting_changed_lines = 1
  " We have to write before using external diff tools
  write
  let b:sy.stats = [-1, -1, -1]
  call sy#start()
  let l:counter = get(g:, "auto_format_changed_lines_signfy_timeout", 500)
  while b:sy.stats == [-1, -1, -1]
    sleep 1m
    let l:counter = l:counter - 1
    if l:counter == 0
        break
    endif
  endwhile
  call FormatChanges()
  let b:is_formatting_changed_lines = 0
endfunction
function! AutoFormatChanges()
  let b:auto_format_changed_lines = 1
endfunction
function! NoAutoFormatChanges()
  let b:auto_format_changed_lines = 0
endfunction
com! -nargs=0 FormatChanges :call FormatChanges()
com! -nargs=0 NoAutoFormatChanges :call NoAutoFormatChanges()
