require "vagrant"

module VagrantPlugins
  module GuestSolaris
    class Plugin < Vagrant.plugin("2")
      name "Solaris guest."
      description "Solaris guest support."

      config("solaris") do
        require File.expand_path("../config", __FILE__)
        Config
      end

      guest("solaris")  do
        require File.expand_path("../guest", __FILE__)
        Guest
      end

      guest_capability("solaris", "change_host_name") do
        require_relative "cap/change_host_name"
        Cap::ChangeHostName
      end

      guest_capability("solaris", "configure_networks") do
        require_relative "cap/configure_networks"
        Cap::ConfigureNetworks
      end

      guest_capability("solaris", "halt") do
        require_relative "cap/halt"
        Cap::Halt
      end

      guest_capability("solaris", "mount_virtualbox_shared_folder") do
        require_relative "cap/mount_virtualbox_shared_folder"
        Cap::MountVirtualBoxSharedFolder
      end

      guest_capability("solaris", "rsync_installed") do
        require_relative "cap/rsync"
        Cap::RSync
      end

      guest_capability("solaris", "rsync_pre") do
        require_relative "cap/rsync"
        Cap::RSync
      end
    end
  end
end
