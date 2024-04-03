#!/usr/bin/env bash

# Quick brainless script to deploy MBR NixOS hosts because im lazy
start() {
    create_partition_table
}

create_partition_table() {
    parted /dev/sda -- mklabel msdos
    parted /dev/sda -- mkpart primary 1MB -8GB
    parted /dev/sda -- set 1 boot on
    parted /dev/sda -- mkpart primary linux-swap -8GB 100%
    format_partitions
}

format_partitions() {
    mkfs.ext4 -L nixos /dev/sda1
    mkswap -L swap /dev/sda2
    mount_fs
}

mount_fs() {
    mount /dev/disk/by-label/nixos /mnt
    swapon /dev/sda2
    generate_config
}

generate_config() {
    nixos-generate-config --root /mnt
    sed -i '15 i boot.loader.grub.device = "/dev/sda";' /mnt/etc/nixos/configuration.nix
    nixos-install
}

start