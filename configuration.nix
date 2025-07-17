{ config, lib, pkgs, ... }:

{
	imports =
    [
    	./hardware-configuration.nix
    	./stylix.nix
		./firefox.nix
    ];

	# ---- Programs ----
	programs = 
	{
		starship.enable = true;
		hyprland = 
		{
			enable = true;
			xwayland.enable = true;
		};
		
		thunar = 
		{
			enable = true;
			plugins = with pkgs.xfce; 
			[
				thunar-archive-plugin
				thunar-volman
			];
		};

		steam = 
		{
			enable = true;
			extraCompatPackages = with pkgs; 
			[
			  proton-ge-bin
			];		
		};
	};

  	environment.systemPackages = with pkgs; 
  	[
		banana-cursor
		bat
		batsignal
		brightnessctl
		cliphist
		code-cursor
		discord
		dunst
		eza
		feh
		freetube
		fzf
		geary
		gimp
		git
		gnumake
		gnutar
		gparted
		gzip
		hyprlock
		hyprpolkitagent
		hyprshot
		kitty
		libnotify
		libvirt
		micro
		mpv
		p7zip
		pamixer
		pandoc
		pulseaudio
		pulsemixer
		qemu
		qemu_kvm
		rar
		ranger
		spice-vdagent # global pasting VM
		starship
		stow
		texlive.combined.scheme-full
		tree
		unzip
		virt-manager
		wget
		wl-clipboard
		wofi
		xfce.thunar
		zoxide
	];
	
	# ---- Fonts ----
	fonts = 
	{
		packages = with pkgs; 
		[
			nerd-fonts.caskaydia-cove
			noto-fonts
			noto-fonts-cjk-sans
			noto-fonts-emoji
			roboto
		];
	};

	# ---- System ----
	system.stateVersion = "25.05";
	time.timeZone = "Europe/Amsterdam";
	nixpkgs.config.allowUnfree = true; 
	
	nix.settings.experimental-features = 
	[ 
		"nix-command" 
		"flakes" 
	];

  	boot.loader = 
  	{
  		systemd-boot.enable = true;
  		efi.canTouchEfiVariables = true;
  	};

  	networking = 
  	{
  		hostName = "legion"; 
  		networkmanager.enable = true;	
  	};

	fileSystems."/home/joris/storage" = 
	{
		device = "/dev/disk/by-uuid/a37c845b-22fc-4070-afa6-104d1ec54e4f";
		fsType = "ext4";
		options = 
		[
			"users" 
			"nofail"
			"exec" # Needed for Steam
		];
	};
	
	# ---- Environment Variables ----
	environment = 
	{
		localBinInPath = true;

		# Ozone Wayland for Electron scaling issues
		#sessionVariables.NIXOS_OZONE_WL = "1";

		variables = 
		{
	    	XCURSOR_THEME = "Banana"; 
	    	XCURSOR_SIZE = "24";
	    	EDITOR = "micro";
	    	VISUAL = "micro";
	    	TERMINAL = "kitty";
		};
	};
	
	# ---- User ----
	users.users.joris = 
	{
		isNormalUser = true;
		extraGroups = 
		[ 
			"wheel" 
			"networkmanager" 
			"libvirtd"
		]; 
	};
		
	# ---- Services ----
	services = 
	{
		gvfs.enable = true;
		tumbler.enable = true;
		gnome.gnome-keyring.enable = true;
	};

	# ---- Virtualization ----
	virtualisation.libvirtd = {
		enable = true;
	  	qemu = {
	    	package = pkgs.qemu_kvm;
	    	ovmf.enable = true;
	  	};
	};

	boot.kernelModules = [ "kvm-amd" "kvm-intel" ];
	programs.dconf.enable = true;
	virtualisation.spiceUSBRedirection.enable = true;

	# One time setup:
	# sudo virsh net-start default
	# sudo virsh net-autostart default

}
