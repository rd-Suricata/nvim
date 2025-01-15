-- /=== colorscheme ==/

return {
  'rebelot/kanagawa.nvim',
  --'AlexvZyl/nordic.nvim',
  enabled = true,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('kanagawa-dragon')
  end,
}
