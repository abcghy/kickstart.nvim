vim.keymap.set('n', 'tt', '<cmd>NvimTreeToggle<cr>', { desc = '[T]ree [T]oggle'})
vim.keymap.set('n', 'tf', '<cmd>NvimTreeFocus<cr>', { desc = '[T]ree [F]ocus' })

return {
  'kyazdani42/nvim-tree.lua',
  dependencies = {
    'kyazdani42/nvim-web-devicons'
  },
  config = function ()
    require('nvim-tree').setup({
      hijack_cursor = true,
      view = {
          width = 50,
          mappings = {
              list = {
                  { key = { "<CR>", "l", }, action = "edit" },
                  { key = { "<BS>", "h", }, action = "close_node"},
              },
          },
      },
      renderer = {
          indent_markers = {
              enable = true,
          },
          icons = {
              show = {
                  folder = false,
              },
              padding = " "
          },
          highlight_opened_files = "all",
      },
  })
  end
}
