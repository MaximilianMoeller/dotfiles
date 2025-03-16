{ pkgs, ...}:

# let
# hypr = "${pkgs.hyprland}/bin/Hyprland";
# config = "/etc/nixos/hyprland-regreet.conf";
# username = "max";
# in
# 
# {
# programs.regreet.enable = true;
# 
# 	services.greetd = {
# 		enable = true;
# 		settings = {
# 			default_session = {
# 				command = "${hypr} --config ${config}";
# 				user = "greeter";
# 			};
# 		};
# 	};
# }

{
	environment.systemPackages = [(
			pkgs.catppuccin-sddm.override {
			flavor = "mocha";
			font  = "Noto Sans";
			fontSize = "9";
			background = "$HOME/currentWallpaper.jpg}";
			loginBackground = true;
			}
			)];

	services.xserver = {
		xkb.layout = "de";
		xkb.variant = "neo";
	};

	services.displayManager = {
		enable = true;
		sddm = {
			enable = true;
			wayland.enable = true;
			theme = "catppuccin-mocha";
			package = pkgs.kdePackages.sddm;
		};
	};
}
