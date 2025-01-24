return {
  "nvim-lualine/lualine.nvim",
  config = function()
    -- Colores basados en el tema personalizado
    local colors = {
      bg = "#191724", -- Fondo oscuro
      fg = "#e0def4", -- Color de texto claro
      rose = "#eb6f92", -- Rosa
      pine = "#31748f", -- Azul verdoso
      gold = "#f6c177", -- Dorado
      foam = "#9ccfd8", -- Espuma (verde suave)
      love = "#ebbcba", -- Amor (rosa cálido)
      overlay = "#6e6a86", -- Superposición (gris claro)
      highlight = "#26233a", -- Resaltado oscuro
    }

    local neomodern_rosepine = {
      normal = {
        a = { fg = colors.bg, bg = colors.rose, gui = "bold" },
        b = { fg = colors.fg, bg = colors.overlay },
        c = { fg = colors.fg, bg = colors.highlight },
      },
      command = { a = { fg = colors.bg, bg = colors.gold, gui = "bold" } },
      insert = { a = { fg = colors.bg, bg = colors.pine, gui = "bold" } },
      visual = { a = { fg = colors.bg, bg = colors.rose, gui = "bold" } },
      terminal = { a = { fg = colors.bg, bg = colors.foam, gui = "bold" } },
      replace = { a = { fg = colors.bg, bg = colors.love, gui = "bold" } },
      inactive = {
        a = { fg = colors.overlay, bg = colors.bg, gui = "bold" },
        b = { fg = colors.overlay, bg = colors.bg },
        c = { fg = colors.overlay, bg = colors.highlight },
      },
    }

    -- Importar el tema basado en la variable de entorno NVIM_THEME
    local env_var_nvim_theme = os.getenv("NVIM_THEME") or "neomodern_rosepine"

    -- Definir una tabla de temas
    local themes = {
      neomodern_rosepine = neomodern_rosepine,
    }

    local mode = {
      "mode",
      fmt = function(str)
        return " " .. str
      end,
    }

    local filename = {
      "filename",
      file_status = true, -- muestra el estado del archivo (solo lectura, modificado)
      path = 0, -- 0 = solo el nombre del archivo, 1 = ruta relativa, 2 = ruta absoluta
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " ", info = " ", hint = " " },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      "diff",
      colored = false,
      symbols = { added = " ", modified = " ", removed = " " }, -- símbolos para los cambios
      cond = hide_in_width,
    }

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = themes[env_var_nvim_theme], -- Establecer el tema basado en la variable de entorno
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "neo-tree", "Avante" },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { "branch" },
        lualine_c = { filename },
        lualine_x = { diagnostics, diff, { "encoding", cond = hide_in_width }, { "filetype", cond = hide_in_width } },
        lualine_y = { "location" },
        lualine_z = { "progress" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { { "location", padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive" },
    })
  end,
}
