{ self, ... }: {
  flake.wrappers.tmux = { wlib, pkgs, config, ... }: let
    tmuxRepo = pkgs.fetchFromGitHub {
      sha256 = "sha256-oRKUZNyJYQXlkeQfbEYiltUEBpvdwn2SoEBWHVUNmrA=";
      rev = "e261deb1b47614eed3400089ce7197dc68acc4eb";
      owner = "tmux-plugins";
      repo = "tpm";
    };

    storePath = placeholder config.outputName;
    pluginDirectory = "~/.local/share/tmux/plugins";

  in {
    imports = [
      wlib.modules.default
      self.wrapperModules.config-catppuccin-flavour
      self.wrapperModules.config-xdg-directories
    ];
    package = pkgs.tmux;
    buildCommand.installTPM = {
      # the sed command is to change the tpm tmux config directory to the nix store one. chmod is because the folder does not have write perms
      data = "cp -r ${tmuxRepo} ${storePath}/tpm && chmod +w ${storePath}/tpm/scripts/helpers/ && sed -i 's|\${XDG_CONFIG_HOME:-\\$HOME/.config}/tmux/tmux.conf|${config.constructFiles."tmux.conf".path}|' ${storePath}/tpm/scripts/helpers/plugin_functions.sh";
    };
    constructFiles."tmux.conf" = {
      relPath = "tmux.conf";
      content = ''
        set -g @plugin "tmux-plugins/tpm"
	set -g @plugin "tmux-plugins/tmux-battery"
	set -g @plugin "catppuccin/tmux#v2.3.0"
        set -g @plugin "christoomey/vim-tmux-navigator"

	unbind C-b
	set -g prefix C-a
	bind-key C-a send-prefix
	
	set -g base-index 1
        
	set -g status-keys vi
	set -g mode-keys vi
        
	bind-key h select-pane -L
        bind-key j select-pane -D
        bind-key k select-pane -U
        bind-key l select-pane -R

	set -g @catppuccin_flavor "${config.catppuccinFlavour}"
        set -g @catppuccin_window_status_style "rounded"
        
	run "${storePath}/tpm/tpm"
        
	set -g status-right-length 100
        set -g status-left-length 100
        set -g status-left ""
        set -g status-right "#{E:@catppuccin_status_application}"
        set -ag status-right "#{E:@catppuccin_status_session}"
        set -ag status-right "#{E:@catppuccin_status_uptime}"
        set -agF status-right "#{E:@catppuccin_status_battery}"
        
	run "${storePath}/tpm/tpm"
      '';
    };
    flags."-f" = config.constructFiles."tmux.conf".path;
    flagSeparator = "";
    runShell = [ "mkdir -p ${pluginDirectory}" ];
    env.TMUX_PLUGIN_MANAGER_PATH = pluginDirectory;
  };
}
