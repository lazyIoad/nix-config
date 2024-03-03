return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  keys = {
    {
      "<leader>c",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      json = { "prettier" },
      rust = { "rustfmt" },
      go = { "gofmt", "goimports" },
      nix = { "nixpkgs_fmt" }
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true
    }
  }
}
