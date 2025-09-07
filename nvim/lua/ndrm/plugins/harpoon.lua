return {
  'ThePrimeagen/harpoon',
  lazy = false,
  config = true,
  keys = {
    { '<leader>a', "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = 'Mark file with harpoon' },
    { '<M-1>', "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = 'ui file with harpoon' },
    { '<M-2>', "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = 'ui file with harpoon' },
    { '<M-3>', "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = 'ui file with harpoon' },
    { '<M-4>', "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = 'ui file with harpoon' },
    { '<M-5>', "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = 'ui file with harpoon' },
    { '<M-6>', "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", desc = 'ui file with harpoon' },
    { '<M-e>', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = 'ui file with harpoon' },
  },
}
