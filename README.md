Hosts:
- `gaius`: NixOS running on a Thinkpad T480
- `valus`: NixOS running on an Oracle Cloud VM (4 CPU/12GB RAM), set up w/ [nixos-infect](https://github.com/elitak/nixos-infect/tree/master)

References:
- https://github.com/MatthiasBenaets/nixos-config
- https://github.com/gvolpe/nix-config
- https://github.com/jonringer/nixpkgs-config

Frequent commands:

```
sudo nix flake update
```

```
sudo nixos-rebuild switch --flake .#gaius
```

```
sudo nix-collect-garbage -d
```

```
sudo nix store gc
```

```
sudo nix-store --optimise
```


To look into:
- https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions
