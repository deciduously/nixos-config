Taken from [@nitsky](https://github.com/nitsky/config)

Assuming existing EFI partitiion with Windows installed at `/dev/nvme0n1p1`.  Windows C drive is at `/dev/nvme0n1p3`, and a reserved MS partition lives at `/dev/nvme0n1p2`.  Set up `/dev/nvme0n1p4` like this:

```
$ sudo cryptsetup luksFormat /dev/nvme0n1p4
$ sudo cryptsetup open /dev/nvme0n1p4 crypt
$ sudo pvcreate /dev/mapper/crypt 
$ sudo vgcreate vg /dev/mapper/crypt
$ sudo lvcreate -L 64G vg -n swap
$ sudo lvcreate -L 128G vg -n root
$ sudo lvcreate -l 100%FREE vg -n home
$ sudo mkswap /dev/vg/swap 
$ sudo swapon /dev/vg/swap 
$ sudo mkfs.btrfs /dev/vg/root
$ sudo mkfs.btrfs /dev/vg/home
$ sudo mkdir /mnt
$ sudo mount /dev/vg/root /mnt
$ sudo mkdir /mnt/boot
$ sudo mount /dev/nvme0n1p1 /mnt/boot/
$ sudo mkdir /mnt/home
$ sudo mount /dev/vg/home /mnt/home
```
Then, install from the flake.

```
$ nix-shell -p nixUnstable git
$ sudo nixos-install --impure --root /mnt --flake github:deciduously/nixos-config#shepard
```

Reboot into new installation.  Then, to get the flake locally:

```
$ cd ~
$ git clone git@github.com:deciduously/nixos-config.git
```

Use the included scripts to update/rebuild/clean.

## Notes

* If `sddm` fails to load after a Plasma update, try clearing the cache: `rm -rf /var/lib/sddm/.cache/sddm-greeter/qmlcache`.  Sudo didn't cut it for me, I needed to switch to root.
