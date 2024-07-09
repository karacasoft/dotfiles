return {
  "ray-x/lsp_signature.nvim",
  config = function()
    local cfg = {}
    require("lsp_signature").setup(cfg)
  end,
}
