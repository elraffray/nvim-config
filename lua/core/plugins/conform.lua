local function gh(repo) return 'https://github.com/' .. repo end

-- [[ Formatting ]]
vim.pack.add { gh 'stevearc/conform.nvim' }
require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
    -- You can specify filetypes to autoformat on save here:
    local enabled_filetypes = {
      lua = true,
      python = true,
      rust = true,
      nix = true,
    }
    if enabled_filetypes[vim.bo[bufnr].filetype] then
      return { timeout_ms = 500 }
    else
      return nil
    end
  end,
  default_format_opts = {
    lsp_format = 'fallback', -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
  },
  -- You can also specify external formatters in here.
  formatters_by_ft = {
    -- rust = { 'rustfmt' },
    -- Conform can also run multiple formatters sequentially
    -- python = { "isort", "black" },
    --
    -- You can use 'stop_after_first' to run the first available formatter from the list
    javascript = { 'prettierd', 'prettier', stop_after_first = true },
    markdown = { 'prettierd' },
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>f', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })

local function show_notification(message, level) vim.notify(message, level, { title = 'conform.nvim' }) end

local function format_toggle(is_global)
  if is_global then
    vim.g.disable_autoformat = not vim.g.disable_autoformat
    if vim.g.disable_autoformat then
      show_notification('Autoformat-on-save disabled globally', 'info')
    else
      show_notification('Autoformat-on-save enabled globally', 'info')
    end
  else
    vim.b.disable_autoformat = not vim.b.disable_autoformat
    if vim.b.disable_autoformat then
      show_notification('Autoformat-on-save disabled for this buffer', 'info')
    else
      show_notification('Autoformat-on-save enabled for this buffer', 'info')
    end
  end
end

vim.keymap.set({ 'n' }, '<leader>tf', function() format_toggle(false) end, { desc = '[T]oggle [f]ormat on-save for current buffer' })
vim.keymap.set({ 'n' }, '<leader>tF', function() format_toggle(true) end, { desc = '[T]oggle [F]ormat on-save globally' })

-- vim: ts=2 sts=2 sw=2 et
