{ config, pkgs, ... }:
{
	stylix = 
	{ 
		enable = true;
		autoEnable = true;
		targets = 
		{
			gtk.enable = true;
			gnome.enable = true;
		};

		# https://tinted-theming.github.io/tinted-gallery/
		base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";

		cursor = 
		{
			package = pkgs.banana-cursor;
			name = "Banana";
			size = 24;
		};

		fonts = 
		{
			serif = 
			{
				package = pkgs.dejavu_fonts;
				name = "DejaVu Serif";
			};

			sansSerif = 
			{
				package = pkgs.dejavu_fonts;
				name = "DejaVu Sans";
			};

			monospace = 
			{
				package = pkgs.dejavu_fonts;
				name = "CaskaydiaCove Nerd Font";
			};

			emoji = 
			{
				package = pkgs.noto-fonts-emoji;
				name = "Noto Color Emoji";
			};
 		};
	};
}
