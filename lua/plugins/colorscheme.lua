-- /=== colorscheme ==/

return {
  --'rebelot/kanagawa.nvim',
  'sainnhe/gruvbox-material',
  --'AlexvZyl/nordic.nvim',
  enabled = true,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_transparent_background = 1
    vim.cmd.colorscheme('gruvbox-material')
  end,
}
