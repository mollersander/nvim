return {
  "amitds1997/remote-nvim.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  cmd = { "RemoteStart", "RemoteStop", "RemoteInfo", "RemoteCleanup", "RemoteConfigDel", "RemoteLog" },
  config = function()
    require("remote-nvim").setup()
  end,
}
