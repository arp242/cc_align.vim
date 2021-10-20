if exists('g:loaded_cc_align') | finish | endif
let g:loaded_cc_align = 1

if get(g:, 'cc_align_no_map', 1)
	inoremap <expr> <Tab>        cc_align#tab()
	inoremap <expr> <S-Tab>      cc_align#tab_end()
	inoremap <expr> <BS>         cc_align#bs()
endif
