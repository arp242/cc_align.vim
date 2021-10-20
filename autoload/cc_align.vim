fun s:disabled() abort
	return !get(g:, 'cc_align_enabled', 1) || &cc is# ''
endfun

fun! s:get_stops() abort
	return &cc->split(',')->map({_, v -> str2nr(v)})->sort('n')
endfun

fun! s:tab() abort
	if &shiftround
		return repeat(' ', &ts - col('.') % &ts) 
	endif
	return repeat(' ', &ts)
endfun

fun! cc_align#tab() abort
	if s:disabled() | return "\<Tab>" | endif
	let col = virtcol('.')
	for s in s:get_stops()
		if s > col
			return repeat(' ', s - col)
		endif
	endfor
	return s:tab()
endfun

fun! cc_align#tab_end() abort
	if s:disabled() | return "\<S-Tab>" | endif
	let col = virtcol('$') - 1
	for s in s:get_stops()
		if s > col
			return repeat(' ', s - col)
		endif
	endfor
	return s:tab()
endfun

fun! cc_align#bs() abort
	if s:disabled() | return "\<BS>" | endif
	let col = virtcol('.')
	for s in s:get_stops()->reverse()
		if s < col
			return "\<C-o>d" .. (col - s) .. 'h'
		endif
	endfor
	return "\<BS>"
endfun
