return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()

    local on_attach = function(_, bufnr)
      vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = bufnr})
    end

    require'lspconfig'.rust_analyzer.setup{
      on_attach = on_attach,
      settings = {
        ['rust-analyzer'] = {
          diagnostics = {
            enable = false;
          }
        },
        telemetry = { enable = false},
        workspace = { checkThirdParty = false }
      }
    }
    require'lspconfig'.pyright.setup{
      on_attach = on_attach,
      settings = {
        telemetry = { enable = false},
        workspace = { checkThirdParty = false }
      }
    }
  end
}
