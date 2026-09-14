{
  self,
  lib,
  ...
}: {
  flake.wrappers.shell-fish-main = {
    pkgs,
    wlib,
    config,
    ...
  }: let
    selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};

    wrapConfig = pkg: pkg.wrap {inherit (config) catppuccinFlavour;};
  in {
    imports = with self.wrapperModules; [fish wlib.modules.default];

    catppuccinFlavour = "mocha";

    runtimePkgs = with selfpkgs;
      map (package: {
        data = package;
        prefix = true;
      }) [
        pkgs.git-lfs
        pkgs.tree
        pkgs.fastfetch

        (wrapConfig starship)
        git
        (wrapConfig tmux)
        (wrapConfig neovim)
        (wrapConfig yazi)
      ];

    env.EDITOR = lib.getExe (wrapConfig selfpkgs.neovim);

    configFile.content = ''
      ${self.wrappers.fish.configFile.content}
      ${lib.getExe selfpkgs.starship} init fish | source

      function yazi
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
          builtin cd -- "$cwd"
        end
        command rm -f -- "$tmp"
      end
    '';
  };
}
