return {
  'windwp/nvim-ts-autotag',
  config = function()
    require('nvim-ts-autotag').setup {
      opts = {
        enable_close = true, -- Auto close tags
        enable_close_on_slash = false, -- Auto close on trailing </
      },
    }
  end,
}
