return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")

    wk.register({
      f = {
        name = "Find",
        f = { "Find File" },
        g = { "Live Grep" },
        s = { "Search Strings" },
      },
      g = {
        name = "LSP",
        d = { "Jump to definition" },
        D = { "Jump to declaration" },
        i = { "List all implementations" },
        r = { "Find all references" },
        s = { "Display signature" },
        l = { "Show diagnostics" },
      },
      l = {
        f = { "Format" }
      }
    }, { prefix = "<leader>" })
  end
}
