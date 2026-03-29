return {
  "gelguy/wilder.nvim",
  event = "CmdlineEnter",
  config = function()
    local wilder = require("wilder")

    wilder.setup({
      modes = { ":", "/", "?" },
    })

    wilder.set_option("renderer", wilder.popupmenu_renderer({
      pumblend = 20,
    }))
  end,
}
