vim.keymap.set('n', 'tt', '<cmd>NvimTreeToggle<cr>', { desc = '[T]ree [T]oggle'})
vim.keymap.set('n', 'tf', '<cmd>NvimTreeFocus<cr>', { desc = '[T]ree [F]ocus' })

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))

end

return {
  'kyazdani42/nvim-tree.lua',
  dependencies = {
    'kyazdani42/nvim-web-devicons'
  },
  config = function ()
    require('nvim-tree').setup({
      hijack_cursor = true,
      on_attach = on_attach,
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
