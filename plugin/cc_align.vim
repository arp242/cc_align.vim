if exists('g:loaded_cc_align') | finish | endif
let g:loaded_cc_align = 1

fun s:disabled() abort
	return !get(g:, 'cc_align_enabled', 1) || &cc is# ''
endfun

if !get(g:, 'cc_align_no_map', 0)
	imap <expr> <C-Right>  <SID>disabled() ? "\<C-Right>" : cc_align#right(1)
	imap <expr> <C-Left>   <SID>disabled() ? "\<C-Left>"  : cc_align#left(1)
	imap <expr> <A-Right>  <SID>disabled() ? "\<A-Right>" : cc_align#right()
	imap <expr> <A-Left>   <SID>disabled() ? "\<A-Left>"  : cc_align#left()

	nmap <expr> <C-Right>  <SID>disabled() ? "\<C-Right>" : cc_align#right(0)
	nmap <expr> <C-Left>   <SID>disabled() ? "\<C-Left>"  : cc_align#left(0)
	nmap <expr> <A-Right>  <SID>disabled() ? "\<A-Right>" : cc_align#right(0)
	nmap <expr> <A-Left>   <SID>disabled() ? "\<A-Left>"  : cc_align#left(0)
endif
