"search the word under the cursor under the cur dir
command! GC :execute 'vimgrep /'.expand('<cword>').'/gj *.py' | copen
command! GR :execute 'vimgrep /'.expand('<cword>').'/gj **/*.py' | copen


"to search current file, use '/gj '.expand('%') instead of '/gj *'



