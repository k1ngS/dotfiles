local overrides = require "configs.overrides"

local plugins = {
  
"nvim-lua/plenary.nvim",

-- Icon
{
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup()
  end,
},

-- Color
{
  "NvChad/nvim-colorizer.lua",
  init = function()
    require("colorizer").setup()
  end,
},

-- ColorSchema
{
  "rebelot/kanagawa.nvim"
},

-- File Explorer

{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  }
},

{
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }},
},

-- LSP STUFF
{
  "williamboman/mason.nvim",
   overrides_options = overrides.mason,
   config = function()
     require("mason").setup()
   end,
},

 {
   "williamboman/mason-lspconfig.nvim",
   config = function()
    require("mason-lspconfig").setup(overrides.mason)
   end,
 },


{
  "neovim/nvim-lspconfig",
  config = function()
    require "lspconfig"
    require "configs.lspconfig"
  end,
 },

 {
  "nvim-treesitter/nvim-treesitter",
    overrides_options = overrides.treesitter,
 },

 --{
 --  "williamboman/nvim-lsp-installer",
 --  event = "BufRead",
 --  config = function()
 --   local lsp_installer = require("nvim-lsp-installer")
 --
 --   lsp_installer.on_server_ready(function(server)
 --     local opts = {}
 --     server:setup(opts)
 --     vim.cmd([[ do UserLspAttachBuffers ]])
 --   end)
 --  end,
 --},

 {
  "elentok/format-on-save.nvim",
  config = function(_, opts)
    require("format-on-save").setup(opts)
  end
 },

{ -- This plugin
  "Zeioth/compiler.nvim",
  cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
  dependencies = { "stevearc/overseer.nvim" },
  opts = {},
},
{ -- The task runner we use
  "stevearc/overseer.nvim",
  commit = "19aac0426710c8fc0510e54b7a6466a03a1a7377",
  cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
  opts = {
    task_list = {
      direction = "bottom",
      min_height = 25,
      max_height = 25,
      default_detail = 1,
      bindings = { ["q"] = function() vim.cmd("OverseerClose") end },
    },
  },
},

{
   "MunifTanjim/prettier.nvim"
},


-- LuaSnips + Cmp
{
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      -- snippet plugin
      "L3MON4D3/LuaSnip",
      dependencies = "rafamadriz/friendly-snippets",
      opts = { history = true, updateevents = "TextChanged", "TextChangedI" },
      config = function(_, opts)
        require("configs.others").luasnip(opts)
      end,
    },

      -- autopairing of (){}[] etc
    {
      "windwp/nvim-autopairs",
      opts = {
        fast_wrap = {},
        disable_filetype = { "TelescopePrompt", "vim" },
      },
      config = function(_, opts)
        require("nvim-autopairs").setup(opts)

        -- setup cmp for autopairs
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end,
    },

      -- cmp sources plugins
    {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
  },
  opts = function()
    return require "configs.cmp"
  end,
  config = function(_, opts)
    require("cmp").setup(opts)
  end,
},

{
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
},

{
  'nvim-lualine/lualine.nvim',
  dependencies = { 
    'nvim-tree/nvim-web-devicons', 
  },
  lazy = false, 
},

{
-- BG Transparent
"xiyaowong/transparent.nvim",
},
}

require("lazy").setup(plugins)
