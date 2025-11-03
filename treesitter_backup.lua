-- Current TreeSitter configuration from nvchad (as of November 2, 2025)
-- This is the original treesitter configuration before changes

{
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects" },
  },
  config = function()
    require("configs.treesitter").setup()
  end,
},
-- Treesitter Textobjects: Additional configuration
{
  "nvim-treesitter/nvim-treesitter-textobjects",
  enabled = false, -- Already configured as dependency above
},
{
  "nvim-treesitter/nvim-treesitter-textobjects",
  enabled = false, -- Already configured as dependency above
},
-- Treesitter Context
{
  "nvim-treesitter/nvim-treesitter-context",
  opts = {},
},
-- Rainbow: Highlight matching HTML/XML tags
{
  "HiPhish/nvim-ts-rainbow2",
  event = "VeryLazy",
},