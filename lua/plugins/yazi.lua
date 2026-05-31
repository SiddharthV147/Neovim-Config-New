return {
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- Opens Yazi in the current working directory
      {
        "<leader>y",
        "<cmd>Yazi cwd<cr>",
        desc = "Open Yazi",
      },
      -- Opens Yazi at the directory of the currently active file
      -- {
      --   "<leader>Y",
      --   "<cmd>Yazi cwd<cr>",
      --   desc = "Open Yazi at current file",
      -- },
    },
    opts = {
      -- Configuration options
      open_for_directories = true,
    },
  },
}
