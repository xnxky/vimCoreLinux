set guifont=Literation\ Mono\ Powerline\ 16
let g:airline_powerline_fonts = 1
"setting according to C:\vim\vimfiles\bundle\vim-airline\plugin\airline.vim
"let g:airline_section_x = '%{g:airline_externals_fugitive}'
"filetype
"let g:airline_section_a = "%{strlen(&filetype)>0?&filetype:''}"
"working directory
let g:airline_section_a = '%{getcwd()}'
"filename
let g:airline_section_b = '%t'
let g:airline_section_c = ''
"g:airline_section_x shows the fucntion name
"row and column number
let g:airline_section_y = ''
let g:airline_section_z = '%3l/%L %4v    0x%04B'
let g:airline_theme = 'light'
