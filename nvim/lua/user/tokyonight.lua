
require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  lazy = false,
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  on_colors = function(colors)
    colors.fg = "#CFE2F3"
    colors.border = "#101010"
  end,
})
