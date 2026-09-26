-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/antosha417/nvim-lsp-file-operations',
}

require('neo-tree').setup {
  window = {
    mappings = {
      -- Disable default space binding (which is also available with <enter>)
      -- to avoid conflict with leader key
      ['<space>'] = 'none',
    },
  },

  default_component_configs = {
    indent = {
      padding = 2,
    },
  },
}

vim.api.nvim_create_autocmd({ 'FileType', 'WinEnter' }, {
  callback = function(args)
    if vim.bo[args.buf].filetype == 'neo-tree' then vim.opt_local.fillchars:append { eob = ' ' } end
  end,
})

vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
vim.keymap.set('n', '<leader>o', function()
  if vim.bo.filetype == 'neo-tree' then
    vim.cmd 'wincmd p'
  else
    vim.cmd 'Neotree focus'
  end
end, { desc = 'Toggle Neo-tree focus' })
