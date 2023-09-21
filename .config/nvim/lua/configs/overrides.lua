local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
    "markdown",
    "markdown_inline",
    "python",
    "go",
    "rust",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- markdown
    "marksman",

    -- lua
    "lua_ls",

    -- web dev
    "cssls",
    "html",
    "tsserver",
   
    -- rust
    "rust_analyzer",

    -- python
    "pyright",
    "pyre",
    "pylyzer",
    "sourcery",
    "pylsp",
    "ruff_lsp",
    "jedi_language_server",

    -- yaml
    "yamlls",
  },
}

return M
