return {
  "cdmill/neomodern.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("neomodern").setup({
      theme = "roseprime",
      -- optional configuration here
      transparent = true,
    })
    require("neomodern").load()
  end,
}
