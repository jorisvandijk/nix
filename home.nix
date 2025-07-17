{ config, pkgs, ... }:

let 
	myUserName = "joris";
in
{

	# ---- Imports ----
	imports = 
	[    
		./stylix.nix
	];

	# ---- GTK ----
	gtk = 
	{
		enable = true;
		iconTheme = 
		{
			name = "Dracula"; 
			package = pkgs.dracula-icon-theme; 
		};
	};

	# ---- XDG ----
	xdg = 
	{
		enable = true;

		configHome = "/home/${config.home.username}/.config";
		dataHome = "/home/${config.home.username}/.local/share";
		cacheHome = "/home/${config.home.username}/.cache";

		userDirs = 
		{
			enable = true;
			createDirectories = true;
			download = "/home/${config.home.username}/downloads";
			documents = "/home/${config.home.username}/documents";
			pictures = "/home/${config.home.username}/pictures";
			videos = "/home/${config.home.username}/.local/videos";
			music = "/home/${config.home.username}/.local/music";
			desktop = "/home/${config.home.username}/desktop";
			templates = "/home/${config.home.username}/.local/templates";
			publicShare = "/home/${config.home.username}/git";
		};
	};

	# ---- Home Manager ---- 
	home = 
	{
		username = myUserName;
		homeDirectory = "/home/${myUserName}";
		stateVersion = "25.05";
	};
	
	programs.home-manager.enable = true;
}
