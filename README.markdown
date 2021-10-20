cc_align.vim uses the `cursorcolumn` setting to align stuff.

This is useful when writing usage text, vim docs, and other aligned text.

- Tab will behave like a regular Tab if `cursorcolumn` is not set.

- If `cursorcolumn` is set Tab will always insert spaces, regardless of the
  `expandtab` setting.

- Press Tab in insert mode to move the cursor to the nearest `cursorcolumn`.

- Press `<S-Tab>` to align the end of the text to the cursorcolumn, rather than
  the cursor.

- And `<BS>` will align the cursor backward to the nearest cursorcolumn.

- If there are no more cursorcolumns in the direction we're moving then it
  behaves as a regular Tab. But again, always spaces! (visual aligment with
  tabs is a bad idea).

All of this assumes that you *only* use cursorcolumn for alignment (which I do).
For this reason you can also set a variable to disable all of this:

    let g:cc_align_enabled = 0

There is no command or mapping for this; you'll have to add one, e.g.

    comm! AlignToggle let g:cc_align_enabled = !g:cc_align_enabled

Set `cc_align_no_map = 1` to disable the automatic mapping. You can use the
`cc_align#tab()`, `cc_align#tab_end()`, and `cc_align#bs()` functions.
