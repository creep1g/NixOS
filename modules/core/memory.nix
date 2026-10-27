# Memory-pressure mitigations.
#
# Symptom this targets: whole-system input lag for many seconds (mouse moves a
# second late) under heavy Electron/browser + video use, then recovery. Logs
# showed no GPU hangs but high shared-memory use and an OOM-killer storm, i.e.
# the kernel stalling in direct reclaim/compaction — not disk swap thrash.
{ ... }:
{
  # Compressed RAM swap. Much faster to reclaim into than the disk swap
  # partition (which barely gets used), giving the kernel fast headroom before
  # it has to stall. NixOS gives zram a higher priority than the disk swap, so
  # disk swap remains only as overflow.
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50; # up to ~15G of compressed swap on 30G RAM
  };

  # Kill a runaway process early instead of letting the machine freeze while
  # the kernel thrashes toward an OOM. Complements systemd-oomd.
  services.earlyoom = {
    enable = true;
    freeMemThreshold = 5;  # act when <5% RAM is free
    freeSwapThreshold = 5; # and <5% swap free
  };

  boot.kernel.sysctl = {
    # Tuned for zram: prefer pushing anonymous pages to fast compressed swap
    # rather than stalling to reclaim file-backed pages.
    "vm.swappiness" = 180;
    "vm.page-cluster" = 0;           # read one page at a time (low latency)
    "vm.watermark_boost_factor" = 0;
    "vm.watermark_scale_factor" = 125;
  };

  # Only build huge pages when an app asks (madvise), avoiding the multi-second
  # direct-compaction stalls that "always" can cause under fragmentation.
  boot.kernelParams = [ "transparent_hugepage=madvise" ];
}
