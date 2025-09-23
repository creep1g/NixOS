{ config, pkgs, ... }:

{
  # Enable microcode updates for Intel CPUs to patch security vulnerabilities
  # and improve performance.
  hardware.cpu.intel.updateMicrocode = true;

  # Enable the graphics stack, which includes the necessary Mesa libraries
  # and drivers for your Intel Iris Xe Graphics.
  hardware.graphics.enable = true;

  # Add the modern Intel media driver for hardware video acceleration (VA-API),
  # which is more efficient for video playback and encoding.
  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
  ];

  # The 'iwlwifi' kernel driver, common for Intel Wi-Fi cards, requires unfree
  # firmware. These two options enable the download and use of that firmware.
  nixpkgs.config.allowUnfree = true;
  hardware.enableRedistributableFirmware = true;
}

