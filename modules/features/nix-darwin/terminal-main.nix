{self, ...}: {
  flake.modules.darwin.feature-terminal-main = {pkgs, ...}: let
    selfpkgs = self.packages.aarch64-darwin;
  in {
    programs = {
      zsh.enable = true;
      bash.enable = true;
      fish.enable = true;
      fish.package = selfpkgs.shell-fish-main;
    };

    environment.systemPackages = [selfpkgs.ghostty];
  };
}
