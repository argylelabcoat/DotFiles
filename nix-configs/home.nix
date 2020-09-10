{ pkgs, ... }:

with import <nixpkgs> {};
{ 
  nixpkgs.config.allowUnfree = true; 
  home.packages = with pkgs; [
    unzip
    xz
    wget
    curl
    vlc
    htop
    ctop
    ytop
    tmux
    fish
    # terms
    alacritty
    xst
    # editors
    atom
    vscode
    emacs
    # odd tools
    zim
    imagemagick
    plantuml
    # light x tools
    xclip
    nedit
    xarchiver
    xfe
    zathura
  ];
  xresources.properties = {
    "XTerm*faceName" = "dejavu sans mono";
    "XTerm*charClass" = [ "37:48" "45-47:48" "58:48" "64:48" "126:48" ];
    "XTerm*allowBoldFonts"= true;
    "XTerm*termName"= "xterm-256color";
    "UXTerm*termName"= "xterm-256color";
    
    #! hard contrast: *background: #1d2021
    "XTerm*background"= "#282828";
    #! soft contrast: *background: #32302f
    "XTerm*foreground"= "#ebdbb2";
    #! Black + DarkGrey
    "XTerm*color0"=  "#282828";
    "XTerm*color8"=  "#928374";
    #! DarkRed + Red
    "XTerm*color1"=  "#cc241d";
    "XTerm*color9"=  "#fb4934";
    #! DarkGreen + Green
    "XTerm*color2"=  "#98971a";
    "XTerm*color10"= "#b8bb26";
    #! DarkYellow + Yellow
    "XTerm*color3"=  "#d79921";
    "XTerm*color11"= "#fabd2f";
    #! DarkBlue + Blue
    "XTerm*color4"=  "#458588";
    "XTerm*color12"= "#83a598";
    #! DarkMagenta + Magenta
    "XTerm*color5"=  "#b16286";
    "XTerm*color13"= "#d3869b";
    #! DarkCyan + Cyan
    "XTerm*color6"=  "#689d6a";
    "XTerm*color14"= "#8ec07c";
    #! LightGrey + White
    "XTerm*color7"=  "#a89984";
    "XTerm*color15"= "#ebdbb2";
  };
  programs = {
    home-manager.enable = true;
    git = {
      package = pkgs.gitAndTools.gitFull;
      enable = true;
      userName = "Matthew Hughes";
      userEmail = "mhughes@rtautomation.com";
    };
    fish = {
    };
    alacritty = {
      enable = true;
      settings = {
	  env = {
	    "TERM" = "xterm-256color";
	  };

	  background_opacity = 0.95;

	  window = {
	    padding.x = 10;
	    padding.y = 10;
	  };

	  font = {
	    size = 8.0;
	  };


	  shell = {
	    program = "fish";
	    args = [
	    ];
	  };

	  colors = {
	    # Default colors
	    primary = {
	      background = "0x1b182c";
	      foreground = "0xcbe3e7";
	    };

	    # Normal colors
	    normal = {
	      black =   "0x100e23";
	      red =     "0xff8080";
	      green =   "0x95ffa4";
	      yellow =  "0xffe9aa";
	      blue =    "0x91ddff";
	      magenta = "0xc991e1";
	      cyan =    "0xaaffe4";
	      white =   "0xcbe3e7";
	    };

	    # Bright colors
	    bright = {
	      black =   "0x565575";
	      red =     "0xff5458";
	      green =   "0x62d196";
	      yellow =  "0xffb378";
	      blue =    "0x65b2ff";
	      magenta = "0x906cff";
	      cyan =    "0x63f2f1";
	      white =   "0xa6b3cc";
	    };
	  };
      };
    };

  };
}
