{ self, lib, ... }: {
  flake.wrappers.terminal-ghostty-main = { pkgs, ... }: 
  let selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system}; in{
    imports = [ self.wrapperModules.ghostty ];
    runtimePkgs = [ selfpkgs.shell-fish-main ];
    flags."--command" = lib.getExe selfpkgs.shell-fish-main;
  };
}
