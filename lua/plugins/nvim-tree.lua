return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require('nvim-tree').setup {} 
    local api = require 'nvim-tree.api'
    vim.keymap.set('n', '<leader>t', api.tree.toggle)
    vim.keymap.set('n', '<leader>tt', api.tree.focus)
  end
}
