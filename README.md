cc_align.vim uses the `cursorcolumn` setting to align stuff. This is useful when
writing usage text, vim docs, and other aligned text.

Use `<C-Right>` and `<C-Left>` to move the cursor to the nearest cursorcolumn.
In insert mode this will always insert spaces, regardless of the expandtab
setting.

Use `<A-Left>` and `<A-Right>` to align the end of the text to the cursorcolumn,
rather than the cursor.

If cursorcolumn isn't set, all mappings will work according to the defaults.

All of this assumes that you *only* use cursorcolumn for alignment (which I do).
For this reason you can also set a variable to disable all of this:

    let g:cc_align_enabled = 0

There is no command or mapping for this; you'll have to add one, e.g.

    comm! AlignToggle let g:cc_align_enabled = !g:cc_align_enabled

Set `cc_align_no_map = 1` to disable the automatic mapping. You can use the
`cc_align#right()`, `cc_align#right_end()`, and `cc_align#left()` functions.
