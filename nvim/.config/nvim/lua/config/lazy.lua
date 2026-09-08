local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")
      local parsers = {
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "json",
        "python",
        "bash",
        "markdown",
      }

      treesitter.setup()
      treesitter.install(parsers)

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          if pcall(vim.treesitter.start, args.buf) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "gr", vim.lsp.buf.references)
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

      vim.api.nvim_create_user_command("Mypy", function()
        if vim.fn.executable("mypy") == 0 then
          vim.notify("mypy is not installed", vim.log.levels.ERROR)
          return
        end

        vim.cmd.write()

        local output = vim.fn.systemlist({ "mypy", "." })
        vim.fn.setqflist({}, "r", {
          title = "mypy",
          lines = output,
          efm = "%f:%l:%c: %trror: %m,%f:%l: %trror: %m,%f:%l:%c: %tarning: %m,%f:%l: %tarning: %m",
        })

        if vim.v.shell_error == 0 then
          vim.cmd.cclose()
          vim.notify("mypy passed")
        else
          vim.cmd.copen()
        end
      end, {})

      vim.keymap.set("n", "<leader>cm", "<cmd>Mypy<cr>")
   
      vim.lsp.config("lua_ls", {})
      vim.lsp.config("pyright", {})
      vim.lsp.config("ruff", {})

      vim.lsp.enable({ "lua_ls", "pyright", "ruff" })
    end,
  },
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = {
        preset = "default",
      },
      completion = {
        documentation = {
          auto_show = true,
        },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          side = "right",
          width = 35,
        },
      })

      vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeToggle<cr>")
    end,
  },
  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   ft = { "markdown" },
  --   opts = {
  --     completions = {
  --       lsp = { enabled = true },
  --     },
  --   },
  -- },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        theme = "tokyonight",
        globalstatus = true,
      },
    },
  },
})
