// Search open tabs
let {commands} = vimfx.modes.normal
vimfx.addCommand({
  name: 'search_tabs',
  description: 'Search tabs',
  category: 'tabs',
  order: commands.focus_location_bar.order + 1,
}, (args) => {
  let {vim} = args
  let {gURLBar} = vim.window
  gURLBar.value = ''
  commands.focus_location_bar.run(args)
  // Change the `*` on the text line to a `%` to search tabs instead of bookmarks.
  gURLBar.value = '% '
  gURLBar.onInput(new vim.window.KeyboardEvent('input'))
})
// vimfx.set('custom.mode.normal.search_tabs', 'O')

// Search bookmarks
vimfx.addCommand({
  name: 'search_bookmarks',
  description: 'Search bookmarks',
  category: 'misc',
  order: commands.focus_location_bar.order + 1,
}, (args) => {
  let {vim} = args
  let {gURLBar} = vim.window
  gURLBar.value = ''
  commands.focus_location_bar.run(args)
  // Change the `*` on the text line to a `%` to search tabs instead of bookmarks.
  gURLBar.value = '* '
  gURLBar.onInput(new vim.window.KeyboardEvent('input'))
})
// vimfx.set('custom.mode.normal.search_bookmarks', 'b')

// Search history
vimfx.addCommand({
  name: 'search_history',
  description: 'Search history',
  category: 'misc',
  order: commands.focus_location_bar.order + 1,
}, (args) => {
  let {vim} = args
  let {gURLBar} = vim.window
  gURLBar.value = ''
  commands.focus_location_bar.run(args)
  // Change the `*` on the text line to a `%` to search tabs instead of bookmarks.
  gURLBar.value = '^ '
  gURLBar.onInput(new vim.window.KeyboardEvent('input'))
})
