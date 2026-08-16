{
  flake.wrappers.wrapper-neovim-conform = {pkgs, ...}: {
    specs.conform = {
      data = pkgs.vimPlugins.conform-nvim;
      config = "require('lua.conform')";
    };

    runtimePkgs = with pkgs;
      map (data: {
        prefix = true;
        inherit data;
      }) [
        alejandra
        stylua
      ];
  };
}
