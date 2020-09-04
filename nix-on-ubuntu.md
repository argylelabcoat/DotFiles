
# Install Nix in Multiuser mode

This command won't work in fish shell, be sure to be using bash or zsh

```sh
sh <(curl -L https://nixos.org/nix/install) --daemon
```

Approve the sudo commands and let it install, once it's done, it may not have properly modified your environment.

For zsh, I added this to my ~/.zshrc:

```sh
source /etc/profile.d/nix.sh
```

For fish, I created a new file named nix.fish in ~/.config/fish/conf.d/ :

```fish
#!/usr/bin/env fish
bass source /etc/profile.d/nix.sh
```

To hide the nixbld1-32 users from login, the following things needed to happen:

GDM:
For nixbld1 through 32 (this is just nixbld1)
```bash
sudo cp /var/lib/AccountsService/users/{gdm,nixbld1} 
```

SDDM:
edit /etc/sddm.conf

add or edit [Users] section:

```conf
[Users]
HideShells=/sbin/nologin
```

