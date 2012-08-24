package :apt_update_index, :provides => :distro_package_reindex do
  description 'Runs apt-get update'
  runner 'apt-get update'
end