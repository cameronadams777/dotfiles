-- Completion keys from dotfiles/nvim: <C-n>/<C-p> select, <C-y>/<CR> confirm, <Esc> close, <C-e> open, no Tab
return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"] = {},
      ["<S-Tab>"] = {},
      ["<C-e>"] = { "show", "hide" },
      ["<C-space>"] = {},
      ["<CR>"] = { "accept", "fallback" },
      ["<Esc>"] = { "hide", "fallback" },
    },
  },
}
