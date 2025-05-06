local neotest_golang_opts = { -- Specify custom configuration
  -- log_level = vim.log.levels.TRACE, -- set log level
  runner = "go",
  go_test_args = {
    "-v",
    "-race",
    "-count=1",
    "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
  },
}

require("neotest").setup {
  adapters = {
    require "neotest-golang"(neotest_golang_opts), -- Registration
  },
}
