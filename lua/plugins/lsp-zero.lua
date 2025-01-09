return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    lazy = true,
    config = false,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = function ()
      require('mason').setup {
        registries = {
          'github:mason-org/mason-registry',
          'github:crashdummyy/mason-registry',
        },
      }
    end
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()
      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
        },
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
          ['<Tab>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        }),
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
      })
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig({
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        lsp_attach = lsp_attach,
        float_border = 'rounded',
        sign_text = true,
      })

      lsp_zero.set_sign_icons({
        error = '󰅙',
        warn = '',
        hint = '󰌵',
        info = ''
      })

      lsp_zero.on_attach(function(_, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
      end)

      require('mason-lspconfig').setup({
        ensure_installed = {
          'ts_ls',
          'cssls',
          'html',
          'lua_ls'
        },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            local nvim_lsp = require('lspconfig')
            nvim_lsp.lua_ls.setup(lua_opts)
            -- Deno Setup
            nvim_lsp.denols.setup {
              on_attach = on_attach,
              root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
            }
            -- Typescript for Deno Setup
            nvim_lsp.ts_ls.setup {
              on_attach = on_attach,
              root_dir = nvim_lsp.util.root_pattern("package.json"),
              single_file_support = false
            }
          end,
        }
      })
      --Enable (broadcasting) snippet capability for completion
      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- capabilities.textDocument.completion.completionItem.snippetSupport = true
      --
      -- require 'lspconfig'.cssls.setup {
      -- 	capabilities = capabilities,
      -- }
    end
  }
}
