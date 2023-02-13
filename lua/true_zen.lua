local true_zen = require('true-zen')

true_zen.setup{
  ui = {
    left = {
      number = true,
      relativenumber = true,
      signcolumn = "yes"
    }
  },
  modes = {
    ataraxis = {
      left_padding = 20,
      right_padding = 20,
      auto_padding = false
    }
  }
}

