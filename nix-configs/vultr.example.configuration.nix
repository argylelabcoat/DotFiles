{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use Grub.
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/vda";
  };

  networking = {
    hostName = "cloudserver";
    useDHCP = false; # deprecated
    interfaces.ens3.useDHCP = true;
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    packages = with pkgs; [
      gohufont kbdKeymaps.dvp kbdKeymaps.neo
    ]; 
    font = "gohufont-uni-14b";
    keyMap = "us";
  };

  # Set your time zone.
  time.timeZone = "America/Chicago";

  environment.systemPackages = with pkgs; [
    wget vim fish zsh tmux git
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Disable root login
  services.openssh.permitRootLogin = "no";

  # Open ports in the firewall.
  # 22 - ssh, 80/443 - web, 53589 - taskd
  networking.firewall.allowedTCPPorts = [ 22 80 443 53589 ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    matthew = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];  # Enable ‘sudo’ for the user.
      shell = pkgs.fish;
    };
  };

  system.stateVersion = "20.03"; # Did you read the comment?

}

