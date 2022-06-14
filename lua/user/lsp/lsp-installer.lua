local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local servers = {
	"cssls",
	"graphql",
	"html",
	"jdtls",
	"jsonls",
	"sumneko_lua",
	"svelte",
	"tsserver",
	"pylsp",
	"tailwindcss"
}

local settings = {
  ensure_installed = servers,
  -- automatic_installation = false,
  ui = {
    icons = {
      -- server_installed = "◍",
      -- server_pending = "◍",
      -- server_uninstalled = "◍",
      -- server_installed = "✓",
      -- server_pending = "➜",
      -- server_uninstalled = "✗",
    },
    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
    },
  },

  log_level = vim.log.levels.INFO,
  -- max_concurrent_installers = 4,
  -- install_root_dir = path.concat { vim.fn.stdpath "data", "lsp_servers" },
}

lsp_installer.setup(settings)

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end
