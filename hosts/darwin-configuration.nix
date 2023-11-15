{ vars, ... }: {
  nix.gc.interval.Day = 7;
  users.users.${vars.user} = {
    home = "/Users/${vars.user}";
  };
}
