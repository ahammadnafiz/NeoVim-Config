return {
{
  "LazyVim/LazyVim",
  opts = {
    colorscheme = "catppuccin",
  },
},
{
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    no_italic = true,
    color_overrides = {
      all = {
        rosewater = '#f66151',
        flamingo = '#f7cc87',
        pink = '#ff8fa3',
        mauve = '#f7cc87',
        red = '#c77dff',
        maroon = '#f66151',
        peach = '#ffa348',
        yellow = '#F5C211',
        green = '#33d17a',
        teal = '#54DBF6',
        sky = '#62a0ea',
        sapphire = '#62a0ea',
        blue = '#62a0ea',
        lavender = '#97dffc',
        text = '#ffffff',
        subtext1 = '#deddda',
        subtext0 = '#c0bfbc',
        overlay2 = '#858585',
        overlay1 = '#737373',
        overlay0 = '#616161',
        surface2 = '#4f4f4f',
        surface1 = '#3e3e3e',
        surface0 = '#2e2e2e',
        base = '#1E1E1E',
        mantle = '#1A1A1A',
        crust = '#101010'
      }
    },
    highlight_overrides = {
      all = function(colors)
        return {
          LineNr = {fg = colors.surface1},
          CursorLineNr = {fg = colors.overlay2},
          CursorLine = {bg = '#252525'},
          ColorColumn = {bg = '#252525'},
          Visual = {bg = colors.surface1},
          MsgArea = {fg = colors.subtext0},
          TabLine = {bg = colors.mantle},
          TabLineFill = {bg = colors.mantle},
          TabLineSel = {fg = colors.subtext0, bg = colors.base},
          GitSignsAdd = {fg = '#467555'},
          GitSignsChange = {fg = '#856f3a'},
          GitSignsDelete = {fg = '#753b34'},
          TelescopeBorder = {fg = colors.subtext0},
          Constant = {fg = colors.blue},
          String = {fg = colors.subtext0},
          Character = {fg = colors.subtext0},
          Number = {fg = colors.blue},
          Boolean = {fg = colors.blue},
          Float = {fg = colors.blue},
          Identifier = {fg = colors.green},
          Function = {fg = colors.green},
          Statement = {fg = colors.green},
          Conditional = {fg = colors.green},
          Repeat = {fg = colors.green},
          Label = {fg = colors.green},
          Operator = {fg = colors.subtext0},
          Keyword = {fg = colors.green},
          Exception = {fg = colors.green},
          PreProc = {fg = colors.yellow},
          Include = {fg = colors.yellow},
          Define = {fg = colors.yellow},
          Macro = {fg = colors.yellow},
          PreCondit = {fg = colors.yellow},
          Type = {fg = colors.blue},
          StorageClass = {fg = colors.overlay2},
          Structure = {fg = colors.subtext0},
          Special = {fg = colors.overlay2},
          SpecialChar = {fg = colors.overlay2}
        }
      end
    },
    integrations = {
      telescope = true,
    },
  },
},

{
  "hrsh7th/nvim-cmp",
  version = false,
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
  },
  opts = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    return {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      matching = {
        disallow_fuzzy_matching = false,
        disallow_partial_matching = false,
        disallow_prefix_unmatching = false,
      },
      preselect = cmp.PreselectMode.Item,
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
          before = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
            })[entry.source.name]
            return vim_item
          end
        }),
      },
      experimental = {
        ghost_text = true,
      },
      performance = {
        debounce = 60,
        throttle = 30,
        fetching_timeout = 500,
      },
    }
  end,
  config = function(_, opts)
    local cmp = require("cmp")
    cmp.setup(opts)

    -- Set up specific filetype behavior
    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        { name = "buffer" },
      })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" }
      })
    })
  end,
},
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                -- Disable other plugins
                autopep8 = { enabled = false },
                flake8 = { enabled = false },
                mccabe = { enabled = false },
                preload = { enabled = false },
                pycodestyle = { enabled = false },
                pydocstyle = { enabled = false },
                pyflakes = { enabled = false },
                pylint = { enabled = false },
                rope_completion = { enabled = false },
                yapf = { enabled = false },
              },
            },
          },
        },
      },
    },
  },
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
}
