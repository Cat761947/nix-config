local nixdOptions = {
  self = "self = (builtins.getFlake (toString <flakeDirectory>));",
  lib = "lib = self.inputs.nixpkgs.lib;",
  wlib = "wlib = self.inputs.nix-wrapper-modules.lib;",
}
nixdOptions.neovimWrapper = "let "
  .. nixdOptions.self
  .. " "
  .. nixdOptions.wlib
  .. " in (wlib.evalModules {modules = [wlib.wrapperModules.neovim];})"

vim.lsp.config("nixd", {
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import (builtins.getFlake (toString <flakeDirectory>)).inputs.nixpkgs {}",
      },
      options = {
        nix_wrapper_modules = {
          expr = "let "
            .. nixdOptions.self
            .. " "
            .. nixdOptions.lib
            .. " "
            .. nixdOptions.wlib
            .. ' in (wlib.evalModules {modules = [wlib.modules.default wlib.wrapperModules.neovim] ++ lib.mapAttrsToList (_: value: value) (lib.filterAttrs (name: _: lib.hasPrefix "config-" name) self.wrapperModules);}).options',
        },

        nix_wrapper_modules_neovim_hosts = {
          expr = nixdOptions.neovimWrapper .. ".options.hosts.type.getSubOptions {}",
        },

        nix_wrapper_modules_neovim_settings = {
          expr = nixdOptions.neovimWrapper .. ".options.settings.type.getSubOptions {}",
        },

        nix_wrapper_modules_neovim_specs = {
          expr = nixdOptions.neovimWrapper .. ".options.specs.type.getSubOptions {}",
        },

        nix_darwin = {
          expr = "let "
            .. nixdOptions.self
            .. " "
            .. nixdOptions.lib
            .. " in (lib.mergeAttrsList (lib.mapAttrsToList (_: value: value.options) self.darwinConfigurations))",
        },

        nix_darwin_home_manager = {
          expr = "let "
            .. nixdOptions.self
            .. " "
            .. nixdOptions.lib
            .. " in (lib.mergeAttrsList (lib.mapAttrsToList (_: value: value.options.home-manager.users.type.getSubOptions {}) self.darwinConfigurations))",
        },

        nix_darwin_users = {
          expr = "let "
            .. nixdOptions.self
            .. " "
            .. nixdOptions.lib
            .. " in (lib.mergeAttrsList (lib.mapAttrsToList (_: value: value.options.users.users.type.getSubOptions {}) self.darwinConfigurations))",
        },

        flake_parts = {
          expr = "let " .. nixdOptions.self .. " in self.debug.options",
        },

        flake_parts_flake = {
          expr = "let " .. nixdOptions.self .. " in self.debug.options.flake.type.getSubOptions {}",
        },

        flake_parts_perSystem = {
          expr = "let " .. nixdOptions.self .. " in self.debug.options.perSystem.type.getSubOptions {}",
        },
      },
    },
  },
})

vim.lsp.config("lua_ls", { settings = { Lua = { codeLense = { enable = true } } } })
require("lz.n").load({
  "lazydev.nvim",
  ft = "lua",
  after = function()
    require("lazydev").setup({
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    })

    require("blink.cmp.config").merge_with({
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
    })
  end,
})

vim.lsp.enable(require("nix-info").settings.lsp_servers)

vim.lsp.codelens.enable()
vim.lsp.linked_editing_range.enable()
vim.lsp.inlay_hint.enable()

vim.diagnostic.config({ virtual_text = true })
