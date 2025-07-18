" Override the default Astro ftplugin to prevent tsconfig.json parsing issues
" This file prevents the built-in astro.vim ftplugin from trying to parse 
" tsconfig.json files that may have JSON5/JSONC syntax

" Only run this once per buffer
if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

" Basic Astro settings
setlocal commentstring=//*%s*/
setlocal suffixesadd=.astro
setlocal include=\\v^\\s*import
setlocal includeexpr=substitute(v:fname,'\\v^[~@]/','src/','')

" Set up proper syntax highlighting
if !exists('g:astro_typescript')
  let g:astro_typescript = 'enable'
endif
if !exists('g:astro_stylus')
  let g:astro_stylus = 'enable'
endif

" Disable the problematic tsconfig parsing functions
if exists('*astro#CollectPathsFromConfig')
  " Override the function to do nothing
  function! astro#CollectPathsFromConfig(...)
    return []
  endfunction
endif

let b:undo_ftplugin = 'setlocal commentstring< suffixesadd< include< includeexpr<'