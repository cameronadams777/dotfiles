require("cameron.plugins-setup")
require("cameron.core.options")
require("cameron.core.keymaps")
require("cameron.core.colorscheme")

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  open_on_setup = true,
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
  filters = {
    dotfiles = true,
  },
})
