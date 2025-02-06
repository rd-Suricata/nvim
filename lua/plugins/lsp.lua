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

    local keymap = vim.keymap -- for conciseness
    
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }
        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
    end,
    })

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
    require'lspconfig'.clangd.setup{}
  end
}
