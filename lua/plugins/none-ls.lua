return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.diagnostics.eslint_d,
      },
    })

    vim.keymap.set("n", "F", vim.lsp.buf.format, {})
  end,
}
