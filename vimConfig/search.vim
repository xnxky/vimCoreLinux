"search the word under the cursor under the cur dir
command! GREP :execute 'vimgrep /'.expand('<cword>').'/gj *' | copen


"to search current file, use '/gj '.expand('%') instead of '/gj *'



