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

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"Just show the filename (no path) in the tab
"let g:airline#extensions#tabline#fnamemod = ':t'
"Without suffix
let g:airline#extensions#tabline#fnamemod = ':r'
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#excludes = ['tags', 'bash']
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
