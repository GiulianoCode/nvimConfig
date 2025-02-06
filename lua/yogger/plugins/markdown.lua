return {
  -- NOTE: Markdown Render
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
  -- NOTE: Obsidian Plugin
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    -- lazy = true,
    -- ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      workspaces = {
        {
          name = "Second Brain",
          path = "/Users/yogger/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second Brain",
        },
      },
      notes_subdir = "inbox",
      new_notes_location = "notes_subdir",
      disable_frontmatter = false,
      templates = { subdir = "templates" },
      ui = { enable = false },

      -- name new notes starting the ISO datetime and ending with note name
      -- put them in the inbox subdir
      note_id_func = function(title)
        local suffix = ""
        -- get current ISO datetime with -5 hour offset from UTC for EST
        local current_datetime = os.date("!%Y-%m-%d-%H%M%S", os.time() - 5 * 3600)
        if title ~= nil then
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return current_datetime .. "_" .. suffix
      end,

      -- Frontmatter personalizado
      -- FIX: Tags sale primero en vez de date, orden incorrecto
      note_frontmatter_func = function(note)
        if note.title then
          note:add_alias(note.title)
        end
        local out = {
          date = os.date("%Y-%m-%d"), -- Use the current date.
          tags = note.tags or {}, -- Use the current tags or an empty table.
          hubs = note.hubs or {}, -- Use the current hubs or an empty table.
          url = note.url or "", -- Use the current url or an empty string.
        }
        -- Make sure those fields are preserved in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,
      vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "New Obsidian Note" }),
      vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianNewFromTemplate<cr>", { desc = "New Obsidian Note (Template)" }),
    },
  },
}
