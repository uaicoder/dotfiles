-- Setup null-ls
local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    formatting.prettier,
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.gofmt,
    formatting.shfmt,
    formatting.clang_format,
    formatting.cmake_format,
    formatting.dart_format,
    formatting.lua_format.with({
      extra_args = {
        '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=100',
        '--break-after-table-lb', '--indent-width=2'
      }
    }),
    formatting.isort,
    formatting.codespell.with({ filetypes = { 'markdown' } })
  },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_augroup("LspFormatting", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = "LspFormatting",
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = true })
      end,
    })
  end
})

-- Setup hdl_checker LSP
-- local lspconfig = require('lspconfig')
-- local lspconfig = require('vim.lsp')
--
-- if not lspconfig.hdl_checker then
--   require('lspconfig.configs').hdl_checker = {
--     default_config = {
--       cmd = { "hdl_checker", "--lsp" },
--       filetypes = { "vhdl", "verilog", "systemverilog" },
--       root_dir = function(fname)
--         return lspconfig.util.find_git_ancestor(fname)
--             or lspconfig.util.root_pattern('.hdl_checker.config')(fname)
--             or lspconfig.util.path.dirname(fname)
--       end,
--       settings = {},
--     }
--   }
-- end

-- lspconfig.hdl_checker.setup({
--   on_attach = function(client, bufnr)
--     -- Optional: Enable formatting or keymaps specific to hdl_checker here
--     vim.api.nvim_create_augroup("LspFormattingHDL", { clear = true })
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       group = "LspFormattingHDL",
--       buffer = bufnr,
--       callback = function()
--         vim.lsp.buf.format({ async = true })
--       end,
--     })
--   end,
-- })

