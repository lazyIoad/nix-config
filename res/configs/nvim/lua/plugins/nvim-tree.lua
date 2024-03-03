local nvimTreeFocusOrToggle = function ()
  local nvimTree = require("nvim-tree.api")
  local currentBuf = vim.api.nvim_get_current_buf()
  local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
  if currentBufFt == "NvimTree" then
    nvimTree.tree.toggle()
  else
    nvimTree.tree.focus()
  end
end

-- Close nvim-tree if it's the last remaining buffer
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})

return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    filters = {
      dotfiles = true,
    }
  },
  keys = {
    {
      "<leader>d",
      nvimTreeFocusOrToggle,
      desc = "Open or focus explorer"
    }
  }
}
