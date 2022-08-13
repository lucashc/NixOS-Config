{ config, pkgs, lib, ... }:
{
  config = let 
    paths = [
        "/home/lucas/Sync"
        "/home/lucas/NixOS"
      ];
  in {
    # Make backups to old NAS
    services.borgbackup.jobs."server" = {
      inherit paths;
      repo = "lcrijns@77.164.100.143:/mnt/backups/autoSyncBackup";
      environment.BORG_RSH = "${pkgs.openssh}/bin/ssh -p 5555 -i /home/lucas/.ssh/id_ecdsa";
      compression = "auto,zstd";
      prune.keep = {
        daily = 7;
        weekly = 4;
        monthly = -1;
      };
      encryption.mode = "none";
      persistentTimer = true;
      startAt = "daily";
    };

    # Make hourly snapshots
    services.snapper = {
      configs.home.subvolume = "/home/lucas";
      snapshotInterval = "hourly";
    };

    # Make backups to Google Drive
    services.restic.backups = {
      gdrive = {
        repository = "rclone:gdrive:backups";
        passwordFile = "/home/secrets/password.txt";
        inherit paths;
        rcloneConfigFile = "/home/secrets/rclone.conf";
      };
    };
  };
}