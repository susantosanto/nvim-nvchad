local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

-- Set VSCode ASCII art as centered header
dashboard.section.header.val = {
  '                                                     ',
  '    ██████╗ ███████╗██╗   ██╗██████╗  ██████╗       ',
  '    ██╔══██╗██╔════╝██║   ██║██╔══██╗██╔═══██╗      ',
  '    ██║  ██║█████╗  ██║   ██║██████╔╝██║   ██║      ',
  '    ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔═══╝ ██║   ██║      ',
  '    ██████╔╝███████╗ ╚████╔╝ ██║     ╚██████╔╝      ',
  '    ╚═════╝ ╚══════╝  ╚═══╝  ╚═╝      ╚═════╝       ',
  '                                                     ',
  '                Visual Studio Code                   ',
  '                                                     ',
}

-- Center the header
dashboard.section.header.opts.hl = 'Include'
dashboard.section.header.opts.position = 'center'

-- Apply the dashboard
alpha.setup(dashboard.opts)