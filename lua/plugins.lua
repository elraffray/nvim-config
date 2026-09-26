-- Load plugin modules in order.

require 'core.plugins.guess-indent'
require 'core.plugins.gitsigns'
require 'core.plugins.which-key'
require 'core.plugins.catppuccin'
require 'core.plugins.todo-comments'
require 'core.plugins.mini'
require 'core.plugins.telescope'
require 'core.plugins.lspconfig'
require 'core.plugins.conform'
require 'core.plugins.blink-cmp'
require 'core.plugins.treesitter'

require 'core.plugins.debug'
require 'core.plugins.indent_line'
require 'core.plugins.lint'
require 'core.plugins.autopairs'
require 'core.plugins.neo-tree'

-- NOTE: You can add your own plugins, configuration, etc. in `lua/custom/plugins/*.lua`.
--
-- For independent modules, uncomment the convenience loader:
-- require 'custom.plugins'
--
-- `custom.plugins` automatically loads files from that directory, but their
-- order is unspecified. If plugins depend on each other, keep them in the same
-- file and put their `vim.pack.add()` and `setup()` calls in the required order.
--
-- If separate modules need a specific order, require them explicitly instead:
-- require 'custom.plugins.colorscheme'
-- require 'custom.plugins.ui'
-- require 'custom.plugins.git'

-- vim: ts=2 sts=2 sw=2 et
