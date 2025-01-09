Vagrant.configure("2") do |config|
  config.vm.box = "fedora/40-cloud-base"
  config.vm.box_version = "40.20240414.0"
  config.vm.provider :libvirt do |libvirt|
    libvirt.driver = "qemu"
    libvirt.cpus = 2
    libvirt.memory = 2048
  end
end

