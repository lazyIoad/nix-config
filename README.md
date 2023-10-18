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
