inputs:
let
  system = "x86_64-linux";
in
inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  modules = [
    { system.stateVersion = "21.05"; }
    (import ./common.nix inputs)
    ({ pkgs, lib, config, ... }: {
      networking = {
        hostName = "shepard";
        interfaces.enp0s31f6.useDHCP = true;
        interfaces.wlp4s0.useDHCP = true;
        wireless = {
          enable = true;
          interfaces = [ "wlp4s0" ];
          networks."Wifi 2: Straight To Video-5G".pskRaw = "178cce712be37708dc23d7ca5a95da437037c509fcff6f611c5b3744aafd58f9";
          #networks."Wifi 2: Straight To Video-5G".priority = 1;
          networks."Wifi 2: Straight To Video".pskRaw = "b77362f8dedf9fc8cb3eb51c0b3e5245fb4283524278e7323f6a8bea71af21ec";
          #networks."Wifi 2: Straight To Video".priority = 2;
          userControlled = {
            enable = true;
            group = "wheel";
          };
        };
      };
      users.users.deciduously = {
        isNormalUser = true;
        createHome = true;
        extraGroups = [ "wheel" ];
        shell = pkgs.bash;
        openssh.authorizedKeys.keyFiles = [ ../deciduously.id_ed25519.pub ];
      };
      boot = {
        #blacklistedKernelModules = [ "psmouse" ];
        consoleLogLevel = 0;
        initrd = {
          availableKernelModules = [
            "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod"
          ];
          kernelModules = [ "dm-snapshot" ];
          luks.devices.crypt.device = "/dev/nvme0n1p5";
          verbose = false;
        };
#        kernelPackages = pkgs.linuxPackages.nvidia_x11;
        kernelModules = [ "kvm-intel" ];
        kernelParams = [
          "quiet"
          "udev.log_priority=3"
          "mem_sleep_default=deep"
        ];
        kernel.sysctl = {
          "fs.inotify.max_user_watches" = "524288";
        };
        supportedFilesystems = [ "ntfs" ];
        loader = {
          efi = {
            canTouchEfiVariables = true;
            efiSysMountPoint = "/boot";
          };
          grub = {
            devices = [ "nodev" ];
            efiSupport = true;
            enable = true;
            extraEntries = ''
              menuentry "Windows" {
                insmod part_gpt
                insmod fat
                insmod search_fs_uuid
                insmod chain
                search --fs-uuid --set=root 97F0-4842
                chainloader /EFI/Microsoft/Boot/bootmgfw.efi
              }
            '';
             version = 2;
          };
        };
      };
      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/97F0-4842";
        fsType = "vfat";
      };
      fileSystems."/" = {
        device = "/dev/mapper/vg-root";
        fsType = "btrfs";
      };
      fileSystems."/home" = {
        device = "/dev/mapper/vg-home";
        fsType = "btrfs";
      };
      fileSystems."/mnt/shared" = {
        device = "/dev/disk/by-uuid/70664E31664DF87C";
        fsType = "ntfs";
        options = [ "rw" "uid=1000"];
      };
      swapDevices = [
       { device = "/dev/mapper/vg-swap"; }
      ];
      #powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
      hardware = {
        video.hidpi.enable = lib.mkDefault true;
        opengl = {
	  enable = true;
	  extraPackages = with pkgs; [
            intel-media-driver
            vaapiIntel
	    vaapiVdpau
	    libvdpau-va-gl
	  ];
	};
        pulseaudio.enable = false; #uses pipewire instead
        nvidia = {
          # package = config.boot.kernelPackages.nvidiaPackages.beta;
          modesetting.enable = true;
        };
        bluetooth.enable = true;
      };
      sound.enable = false;
      services = {
				postgresql = {
					enable = true;
				};
        xserver = {
	  			dpi = 96;
          enable = true;
          videoDrivers = [ "nvidia" ];
          displayManager.sddm.enable = true;
          desktopManager.plasma5.enable = true;
          layout = "us";
	  xkbOptions = "ctrl:swapcaps";
       };
    };
      nixpkgs.config.firefox.enablePlasmaBrowserIntegration = true;
      nix.extraOptions = ''
        keep-outputs = true
        keep-derivations = true
      '';
    })
    inputs.home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = {
        hostname = "shepard";
        inherit inputs;
        inherit system;
      };
      home-manager.users.deciduously = { ... }: {
        home.stateVersion = "21.05";
        imports = [ ../users/deciduously.nix ];
      };
    }
  ];
}
