vim.keymap.set('n', 'tt', '<cmd>NvimTreeToggle<cr>', { desc = '[T]ree [T]oggle'})

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
