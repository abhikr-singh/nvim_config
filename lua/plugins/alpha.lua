return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  enabled = true,
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.startify")
    dashboard.section.header.val = {
      [[                                                                       ]],
      [[ █▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█ ]],
      [[ █                                                                       █ ]],
      [[ █                                                                       █ ]],
      [[ █                                                                     █ ]],
      [[ █       ████ ██████           █████      ██                     █ ]],
      [[ █      ███████████             █████                             █ ]],
      [[ █      █████████ ███████████████████ ███   ███████████   █ ]],
      [[ █     █████████  ███    █████████████ █████ ██████████████   █ ]],
      [[ █    █████████ ██████████ █████████ █████ █████ ████ █████   █ ]],
      [[ █  ███████████ ███    ███ █████████ █████ █████ ████ █████  █ ]],
      [[ █ ██████  █████████████████████ ████ █████ █████ ████ ██████ █ ]],
      [[ █                                                                       █ ]],
      [[ █                       😎 Happy Coding ! 😇                            █ ]],
      [[ █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ ]],
    }

    alpha.setup(dashboard.opts)
  end,
}
