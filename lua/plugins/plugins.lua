local plugins = {
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      for i = 1, 5 do
        vim.keymap.set("n", "<leader>" .. i, function()
          ui.nav_file(i)
        end, { desc = "Harpoon: go to file " .. i })
      end
    end,
  },

  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",           -- tells lazy to load when this cmd is used
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "User FilePost",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.clang_format,
        },
      })
    end,
  },

  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>y",
        "<cmd>Yazi<cr>",
        desc = "Open Yazi",
      },
    },
    opts = {
      open_for_directories = true,
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua", "python", "c", "cpp", "rust",
        "java", "html", "css", "bash",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
      require("configs.lspconfig")
    end,
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd", "clang-format", "codelldb",
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "mason-org/mason.nvim",
    },
    opts = {
      handlers = {},
      ensure_installed = {
        "codelldb",
      },
    },
  },

}

return plugins
