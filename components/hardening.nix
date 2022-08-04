{ config, lib, pkgs, ... }:
{
  config = {
    # Enable AppArmor confinement
    security.apparmor.enable = true;
    
    # Allow only wheel users to use Nix
    nix.allowedUsers = [ "@wheel" ];

    # Kernel options for security
    # Disable ptrace outside parent process scope
    boot.kernel.sysctl."kernel.yama.ptrace_scope" = 1;
    # Restrict read of kernel logging buffer
    boot.kernel.sysctl."kernel.dmesg_restrict" = 1;
    # Disable unprivileged eBPF
    boot.kernel.sysctl."kernel.unprivileged_bpf_disabled" = 1;
    # Prevent SUID binaries from dumping core
    boot.kernel.sysctl."fs.suid_dumpable" = 1;
    # Disable kexec, as it is not needed
    boot.kernel.sysctl."kernel.kexec_load_disabled" = 1;

    # TODO: Remount certain locations with nodev, nosuid, noexec, etc.
  };
}