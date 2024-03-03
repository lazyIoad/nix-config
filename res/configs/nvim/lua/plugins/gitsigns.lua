return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = true,
  keys = {
    {
      "<leader>hp",
      function() require("gitsigns").preview_hunk() end,
      desc = "Preview hunk"
    },
    {
      "<leader>hr",
      function() require("gitsigns").reset_hunk() end,
      desc = "Reset hunk"
    },
    {
      "<leader>hb",
      function() require("gitsigns").blame_line() end,
      desc = "Blame line"
    }
  }
}