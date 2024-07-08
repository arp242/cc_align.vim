fun! s:get_stops() abort
	return &cc->split(',')->map({_, v -> str2nr(v)})->sort('n')
endfun

fun! cc_align#right(insmode) abort
	let col = virtcol('.')
	for s in s:get_stops()
		if s > col
			if a:insmode
				return repeat(' ', s - col)
			else
				return (s - col) .. 'l'
			endif
		endif
	endfor
	return ''
endfun

fun! cc_align#left(insmode) abort
	let col = virtcol('.')
	for s in s:get_stops()->reverse()
		if s < col
			if a:insmode
				return "\<C-o>d" .. (col - s) .. 'h'
			else
				return (col - s) .. 'h'
			endif
		endif
	endfor
	return ''
endfun

fun! cc_align#right_end() abort
	let col = virtcol('$') - 1
	for s in s:get_stops()
		if s > col
			return repeat(' ', s - col)
		endif
	endfor
	return ''
endfun

fun! cc_align#left_end() abort
	let col = virtcol('$') - 1
	for s in s:get_stops()->reverse()
		if s < col
			return "\<C-o>d" .. (col - s) .. 'h'
		endif
	endfor
	return ''
endfun
