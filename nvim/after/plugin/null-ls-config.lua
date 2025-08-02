-- null-ls-config.lua
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    -- JavaScript / TypeScript / HTML / CSS
    formatting.prettier,

    -- Python
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.isort,

    -- Go
    formatting.gofmt,

    -- Shell scripts
    formatting.shfmt,

    -- C / C++ using Google style
    formatting.clang_format.with({
      extra_args = { "--style=Google" },
    }),

    -- CMake
    formatting.cmake_format,

    -- Dart (uncomment if needed)
    -- formatting.dart_format,

    -- Lua
    formatting.lua_format.with({
      extra_args = {
        "--no-keep-simple-function-one-line",
        "--no-break-after-operator",
        "--column-limit=100",
        "--break-after-table-lb",
        "--indent-width=2",
      },
    }),

    -- Markdown / Docs
    formatting.codespell.with({
      filetypes = { "markdown" },
    }),
  },

  -- Auto-format on save
  on_attach = function(client, bufnr)
    if client and client.supports_method and client.supports_method("textDocument/formatting") then
      local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = true })
        end,

      })
    end
  end,
})
