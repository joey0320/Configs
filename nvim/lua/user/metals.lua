

local on_attach = function(_, bufnr)
	print("LSP started.");

  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gt', vim.lsp.buf.type_definition, '[G]oto [T]ype Definition')
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
end

----------------------------------
-- LSP Setup ---------------------
----------------------------------


metals_config = require("metals").bare_config()
metals_config.init_options.statusBarProvider = "on"
metals_config.settings = {
  serverVersion = "latest.snapshot"
}
metals_config.on_attach = on_attach




local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach({metals_config})
  end,
  group = nvim_metals_group,
})


