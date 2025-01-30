return {

  --- Default Markdown render ---
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    opts = {},
    config = function()
      require("render-markdown").setup({
        code = {
          disable_background = true,
          border = "none",
          left_pad = 1,
        },
      })
    end,
  },

  --- Obsidian ---
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      workspaces = {
        {
          name = "Second Brain",
          path = "/Users/yogger/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second Brain",
        },
      },
    },
    config = function(_, opts)
      require("obsidian").setup({
        dir = opts.workspaces[1].path, -- Aseguramos que use el workspace
        ui = { enable = false },
      })
    end,
  },
}
