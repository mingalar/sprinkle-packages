package :apt_upgrade, :provides => :distro_package_upgrade do
  description 'Runs apt-get upgrade'
  runner 'apt-get upgrade -y'
end