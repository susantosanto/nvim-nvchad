-- Modern and Professional Notification Configuration for NvChad
-- This creates elegant notifications that appear at the top-right corner

local M = {}

M.setup = function()
  -- Set up nvim-notify with modern styling
  local notify = require("notify")

  notify.setup({
    -- Position the notifications at the top-right
    position = "top_right",
    
    -- Use a clean, modern background style
    background_colour = "Normal",
    
    -- Styling for the notification window
    render = "default", -- or "minimal", "compact"
    
    -- Timeout in milliseconds (0 means no timeout)
    timeout = 3000,
    
    -- Maximum number of notifications to show at once
    max_width = 80,
    max_height = 20,
    
    -- Styling for different levels
    stages = "fade_in_slide_out", -- Animation: fade_in_slide_out, fade, slide
    
    -- Custom top padding to position at top
    top_padding = 2,
    
    -- Custom icons for different notification levels
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
    },
  })

  -- Override the default vim.notify with our configured notify
  vim.notify = notify
end

return M