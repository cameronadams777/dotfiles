require("cameron.plugins-setup")
require("cameron.core.options")
require("cameron.core.keymaps")
require("cameron.core.colorscheme")

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  open_on_setup = false,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {}
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
})

require('git-blame-line').setup({
  git = {
    default_message = 'Not committed yet',
    blame_format = '%an - %ar - %s' -- see https://git-scm.com/docs/pretty-formats
  },
  view = {
    left_padding_size = 5,
    enable_cursor_hold = false
  }
})
