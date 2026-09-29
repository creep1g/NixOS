{ pkgs, ... }:
{
  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true; # iwlwifi firmware etc.

  # intel_gpu_top and friends, for checking GPU/video-engine usage.
  environment.systemPackages = [ pkgs.intel-gpu-tools ];

  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver # iHD VA-API driver (Gen11+)
    vpl-gpu-rt         # oneVPL runtime for Xe media (decode/encode)
  ];

  # Force apps onto the modern iHD VA-API driver so video is hardware-decoded
  # rather than falling back to CPU (a common cause of stutter under load).
  environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";

  # i915 tuning for stability with external displays:
  #   enable_psr=0  - Panel Self Refresh on Intel is a frequent cause of
  #                   multi-second freezes/stalls when an external monitor is
  #                   attached; turning it off is the standard fix.
  #   enable_guc=3  - load GuC (submission) + HuC (media) firmware, which
  #                   offloads scheduling/decoding and smooths playback.
  boot.kernelParams = [
    "i915.enable_psr=0"
    "i915.enable_guc=3"
  ];
}
