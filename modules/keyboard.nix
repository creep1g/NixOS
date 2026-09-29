{ ... }:
{
  # Custom XKB layout (selected in configuration.nix via services.xserver.xkb).
  services.xserver.xkb.extraLayouts.custom = {
    description = "Custom US Layout";
    languages = [ "eng" ];
    symbolsFile = ./xkb/custom;
  };
}
