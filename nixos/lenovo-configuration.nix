{ config, lib, ... }:

{
    hardware.trackpoint= {
	    enable = true;
	    emulateWheel = true;
	    speed = 2;
	    sensitivity = 64;
	};

  # Fingerprint reader: login and unlock with fingerprint (if you add one with `fprintd-enroll`)
   services.fprintd.enable = true;
   
  # Force use of the thinkpad_acpi driver for backlight control.
  # This allows the backlight save/load systemd service to work.
  boot.kernelParams = [ "acpi_backlight=native" ];
}
