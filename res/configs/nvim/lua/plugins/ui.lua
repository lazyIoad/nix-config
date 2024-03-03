local function _8_()
  return (require("trouble")).toggle("document_diagnostics")
end
return {{"folke/trouble.nvim", event = "VeryLazy", keys = {{"<leader>t", _8_, desc = "Open diagnostics"}}}}
