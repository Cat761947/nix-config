{
  flake.modules.darwin.config-primary-user-setup = {config, ...}: {
    users = {
      users.${config.system.primaryUser} = {
        home = "/Users/${config.system.primaryUser}";
        uid = 501;
      };
      knownUsers = [config.system.primaryUser];
    };
  };
}
