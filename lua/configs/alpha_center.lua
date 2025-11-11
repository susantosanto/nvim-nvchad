local dap = require("dashboard")

-- Configure dashboard-nvim
dap.setup({
  theme = "hyper",
  config = {
    -- header = {
    --   '',
    --   '    ┌─┐┌─┐┌─┐┌─┐┬┌─┐┬ ┬┌─┐┌─┐    ',
    --   '    │  │ │├┤ ├┤ ││  ├─┤├─┤│      ',
    --   '    └─┘└─┘└─┘└  ┴└─┘┴ ┴┴ ┴└─┘    ',
    --   '',
    --   '           SANTO  CODE            ',
    --   '',
    -- },
    header = {
      "",
      "    SANTO CODE MODERN EDITOR    ",
      "",
    },
    center = {
      {
        icon = "  ",
        icon_hl = "DashboardCenterIcon",
        desc = "New File              ",
        desc_hl = "DashboardCenterText",
        key = "e",
        key_hl = "DashboardCenterKey",
        action = "ene <BAR> startinsert",
      },
      {
        icon = "  ",
        icon_hl = "DashboardCenterIcon",
        desc = "Find File             ",
        desc_hl = "DashboardCenterText",
        key = "SPC f f",
        key_hl = "DashboardCenterKey",
        action = "Telescope find_files",
      },
      {
        icon = "  ",
        icon_hl = "DashboardCenterIcon",
        desc = "Recent Files          ",
        desc_hl = "DashboardCenterText",
        key = "SPC f r",
        key_hl = "DashboardCenterKey",
        action = "Telescope oldfiles",
      },
      {
        icon = "  ",
        icon_hl = "DashboardCenterIcon",
        desc = "Find Text             ",
        desc_hl = "DashboardCenterText",
        key = "SPC f g",
        key_hl = "DashboardCenterKey",
        action = "Telescope live_grep",
      },
      {
        icon = "  ",
        icon_hl = "DashboardCenterIcon",
        desc = "Find Themes           ",
        desc_hl = "DashboardCenterText",
        key = "SPC f t",
        key_hl = "DashboardCenterKey",
        action = "Telescope themes",
      },
      {
        icon = "  ",
        icon_hl = "DashboardCenterIcon",
        desc = "Quit                  ",
        desc_hl = "DashboardCenterText",
        key = "q",
        key_hl = "DashboardCenterKey",
        action = "qa",
      },
    },
    footer = {
      "   Modern Development Environment                      ",
    },
  },
})

-- Set custom highlight groups for modern look
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#7aa2f7", bold = true })
vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#a9b1d6", italic = true })
vim.api.nvim_set_hl(0, "DashboardCenterIcon", { fg = "#bb9af7" })
vim.api.nvim_set_hl(0, "DashboardCenterText", { fg = "#a9b1d6" })
vim.api.nvim_set_hl(0, "DashboardCenterKey", { fg = "#7dcfff", bold = true })
