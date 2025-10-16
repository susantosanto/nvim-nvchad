-- Modern and Professional Notification Configuration for NvChad using notifier.nvim
-- This creates elegant notifications with modern styling

local M = {}

M.setup = function()
  -- Set up notifier.nvim with modern styling
  local notifier = require("notifier")

  notifier.setup({
    -- Animation configuration for smooth transitions
    animation = {
      enabled = true,
      fps = 60,
      duration = 400,
      easing = "in_out_cubic",
    },

    -- Appearance settings for modern look
    appearance = {
      -- Border style for notifications
      border = {
        style = "rounded",
        highlight = "FloatBorder",
        title = true,  -- Show title with level name
      },

      -- Padding around notification content
      padding = {
        top = 0,
        bottom = 0,
        left = 1,
        right = 1,
      },

      -- Width and height constraints
      width = 50,  -- Maximum width in characters
      max_height = 8,  -- Maximum height in lines

      -- Position of notifications is controlled by groups
      -- Styling elements
      highlight = {
        background = "NotifyBackground",  -- Custom background
        border = "NotifyBorder",          -- Custom border
        title = "NotifyTitle",            -- Custom title styling
        icon = "NotifyIcon",              -- Custom icon styling
        message = "NotifyMessage",        -- Custom message styling
      },
    },

    -- Styling for different notification levels with modern icons
    levels = {
      info = {
        icon = "󰋼",
        highlight = "NotifyINFO",
        title = "Info",
      },
      warn = {
        icon = "󰌱", 
        highlight = "NotifyWARN",
        title = "Warning",
      },
      error = {
        icon = "󰅚",
        highlight = "NotifyERROR",
        title = "Error",
      },
      debug = {
        icon = "",
        highlight = "NotifyDEBUG",
        title = "Debug",
      },
      trace = {
        icon = "",
        highlight = "NotifyTRACE",
        title = "Trace",
      }
    },

    -- Timeout settings (in milliseconds)
    timeout = {
      default = 4000,  -- Default timeout for notifications
      disable = 0,     -- Set to 0 to disable auto-dismiss
    },

    -- Behavior settings
    behavior = {
      -- Whether to replace existing notifications with same ID
      replace = true,
      
      -- Whether to queue notifications
      queue = true,
      
      -- Maximum number of concurrent notifications
      max_concurrent = 5,
      
      -- Enable history
      history = true,
    },

    -- Group configuration (for positioning notifications in different areas)
    groups = {
      ["top-right"] = {
        position = "top-right",
        size = 5,  -- Max notifications in this group
      },
      ["top-left"] = {
        position = "top-left",
        size = 5,
      },
      ["bottom-right"] = {
        position = "bottom-right",
        size = 5,
      },
      ["bottom-left"] = {
        position = "bottom-left", 
        size = 5,
      },
    },
    -- Set default group to top-right
    default_group = "top-right",
    
    -- Styling options for a more modern look
    styling = {
      -- Whether to use custom colors
      custom_colors = true,
      
      -- Color palette for different levels
      colors = {
        info = { bg = "#2d3f50", fg = "#add8e6" },
        warn = { bg = "#4d4422", fg = "#ffff99" },
        error = { bg = "#5f2d2d", fg = "#ff9999" },
        debug = { bg = "#404060", fg = "#ccaaff" },
        trace = { bg = "#3a3a3a", fg = "#cccccc" },
      }
    }
  })

  -- Override the default vim.notify with our configured notifier
  vim.notify = notifier.notify
end

return M