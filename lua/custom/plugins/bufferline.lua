local function gh(repo) return 'https://github.com/' .. repo end

-- Add buffer tabs, similar to GUI IDEs.
vim.pack.add { gh 'akinsho/bufferline.nvim' }

require('bufferline').setup {
  options = {
    mode = 'buffers',
    themable = true,
    offsets = {
      {
        filetype = 'neo-tree',
        text = '',
        separator = true,
        text_align = 'left',
      },
    },
    diagnostics = 'nvim_lsp',
    separator_style = { '', '' },
    modified_icon = '●',
  },
}
-- vim: ts=2 sts=2 sw=2 et
