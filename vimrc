""************************************************************************
"this is to source all the customized settings files
let vimConfigDir = '$HOME/Tools/vim/vimConfig'
execute 'source '.vimConfigDir.'/pathogen.vim'
execute 'source '.vimConfigDir.'/basic.vim'
source $VIMRUNTIME/vimrc_example.vim
execute 'source '.vimConfigDir.'/taglist.vim'
execute 'source '.vimConfigDir.'/tagbar.vim'
execute 'source '.vimConfigDir.'/diff.vim'
execute 'source '.vimConfigDir.'/autocomp.vim'
execute 'source '.vimConfigDir.'/eclim.vim'
execute 'source '.vimConfigDir.'/mark.vim'
execute 'source '.vimConfigDir.'/fold.vim'
execute 'source '.vimConfigDir.'/statusline.vim'
execute 'source '.vimConfigDir.'/buffer.vim'
execute 'source '.vimConfigDir.'/quickfix.vim'
execute 'source '.vimConfigDir.'/nerdtree.vim'
execute 'source '.vimConfigDir.'/paste.vim'
execute 'source '.vimConfigDir.'/search.vim'
execute 'source '.vimConfigDir.'/ctags.vim'
execute 'source '.vimConfigDir.'/supertab.vim'
execute 'source '.vimConfigDir.'/errorformat.vim'
"rope is not supported yet;
execute 'source '.vimConfigDir.'/rope.vim'
execute 'source '.vimConfigDir.'/gundo.vim'
execute 'source '.vimConfigDir.'/syntastic.vim'
execute 'source '.vimConfigDir.'/makegreen.vim'
"execute 'source '.vimConfigDir.'/virtualenv.vim'
execute 'source '.vimConfigDir.'/ultisnips.vim'
execute 'source '.vimConfigDir.'/indent.vim'
execute 'source '.vimConfigDir.'/ctrlp.vim'
execute 'source '.vimConfigDir.'/ConqueTerm.vim'
execute 'source '.vimConfigDir.'/unite.vim'
execute 'source '.vimConfigDir.'/cscope.vim'
"execute 'source '.vimConfigDir.'/vimpy.vim'
execute 'source '.vimConfigDir.'/go.vim'
set autochdir
"*************************************************************************
""************************************************************************
" google plugins
"execute 'source /usr/share/vim/google/google.vim'
"execute 'source /google/src/head/depot/google3/tools/gsearch/contrib/csearch.vim'
"execute 'source '.vimConfigDir.'/google.vim'
filetype plugin indent on
