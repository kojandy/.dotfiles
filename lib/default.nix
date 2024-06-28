{ nixpkgs }:
let
  inherit (builtins) foldl' attrValues mapAttrs listToAttrs;
  inherit (nixpkgs.lib.attrsets) recursiveUpdate;
in {
  mkHome = userList: foldl' (acc: elem: recursiveUpdate acc elem) {
      home-manager.useGlobalPkgs = true;
      home-manager.backupFileExtension = "bak";
  } (
    attrValues (mapAttrs (username: userconfig: {
      users.users.${username}.home = "/Users/${username}";
      home-manager.users.${username} = { config, ... }: {
        home.file = mapAttrs (name: path: { source = path; }) (userconfig.file.root or {});
        xdg.configFile = listToAttrs (
          map (program: { name = program; value = { source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/${program}"; recursive = true; }; })
          (userconfig.file.configs or [])
        );
        home.stateVersion = "24.11";
      };
    }) userList)
  );
}
