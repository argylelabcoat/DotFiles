# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  networking = {

    hostName = "raptor-func-1"; # Define your hostname.
    defaultGateway = "10.10.0.1";
    nameservers = ["10.10.0.5" "1.1.1.1" "9.9.9.9"];
    useDHCP = false;
    interfaces = {
      # enp0s20f0u2.useDHCP = true;
      enp0s31f6.useDHCP = true;
      usb0.useDHCP = true;
      wlp2s0.useDHCP = true;
    };
    wireless = {
      enable = true;  # Enables wireless support via wpa_supplicant.
      interfaces = [ "wlp2s0" ];
      userControlled.enable = true;
      userControlled.group = "wheel";
      networks = {
        "{{wifi.ssid}}" = {
          psk = "{{wifi.password}}";
        };
      };
    };

  };


  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    packages = [pkgs.gohufont pkgs.kbdKeymaps.dvp pkgs.kbdKeymaps.neo ]; 
    font = "gohufont-uni-14b";
    keyMap = "us";
  };
 
  # Set your time zone.
  time.timeZone = "America/Chicago";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget curl zsh fish bash neovim vim tmux unzip xz bat home-manager
    docker-compose lazydocker ctop 
    htop ytop python38Packages.glances 
    ubuntu_font_family fira-code fira-code-symbols noto-fonts siji font-awesome-ttf
    xfe midori luakit nedit xarchiver xclip xdotool feh zathura alacritty 
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  # Enable Docker 
  virtualisation.docker.enable = true;
  # Ignore laptop lid
  services.logind.lidSwitch = "ignore";

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 80 443 44818 502 ];
  networking.firewall.allowedUDPPorts = [ 2222 ];
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.xserver = {
    enable = true;
    layout = "us";
    libinput.enable = true;

    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
      defaultSession = "none+icewm";
    };
    windowManager.icewm = {
      enable = true;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    rta = {
      isNormalUser = true;
      extraGroups = [ "wheel" "docker" "video" "input"]; # Enable ‘sudo’ for the user.
      shell = pkgs.zsh;
    };
    matthew = {
      isNormalUser = true;
      extraGroups = ["wheel" "docker" "video" "input"];
    };
  };
  home-manager.useUserPackages = true;
  #home-manager.useGlobalPkgs = true;

  home-manager.users = {
    matthew = { pkgs, ... }: {
      home.packages = with pkgs; [ atool httpie fish alacritty ];
      programs.fish.enable = true;
      programs.git = {
    	enable = true;
    	userName = "Matthew Hughes";
    	userEmail = "mhughes@rtautomation.com";
      };
      programs.home-manager = {
        enable = true;
      };
      programs.alacritty.settings = {
        enable = true;
      	font.size = "9.5";
      };
    };
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}

