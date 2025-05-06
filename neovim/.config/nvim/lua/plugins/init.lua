return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
        "gowork",
        "gomod",
        "gosum",
        "gotmpl",
      },
    },
  },
  {
    "nvim-neotest/neotest",
    lazy = false,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "fredrikaverpil/neotest-golang",
        version = "*",
        dependencies = {
          "andythigpen/nvim-coverage", -- Added dependency
        },
      }, -- Installation
    },
    config = function()
      require "configs.neotest"
    end,
    keys = {
      {
        "<leader>ta",
        function()
          require("neotest").run.attach()
        end,
        desc = "[t]est [a]ttach",
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand "%")
        end,
        desc = "[t]est run [f]ile",
      },
      {
        "<leader>tA",
        function()
          require("neotest").run.run(vim.uv.cwd())
        end,
        desc = "[t]est [A]ll files",
      },
      {
        "<leader>tS",
        function()
          require("neotest").run.run { suite = true }
        end,
        desc = "[t]est [S]uite",
      },
      {
        "<leader>tn",
        function()
          require("neotest").run.run()
        end,
        desc = "[t]est [n]earest",
      },
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "[t]est [l]ast",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "[t]est [s]ummary",
      },
      {
        "<leader>to",
        function()
          require("neotest").output.open { enter = true, auto_close = true }
        end,
        desc = "[t]est [o]utput",
      },
      {
        "<leader>tO",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "[t]est [O]utput panel",
      },
      {
        "<leader>tt",
        function()
          require("neotest").run.stop()
        end,
        desc = "[t]est [t]erminate",
      },
      {
        "<leader>td",
        function()
          require("neotest").run.run { suite = false, strategy = "dap" }
        end,
        desc = "Debug nearest test",
      },
      {
        "<leader>tD",
        function()
          require("neotest").run.run { vim.fn.expand "%", strategy = "dap" }
        end,
        desc = "Debug current file",
      },
    },
  },
  {
    "andythigpen/nvim-coverage",
    version = "*",
    lazy = false,
    config = function()
      require("coverage").setup {
        auto_reload = true,
      }
    end,
  },
}
