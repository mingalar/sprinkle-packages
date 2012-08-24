package :apt_enable_auto_upgrades, :provides => :distro_auto_update do
  description 'Automatically update system'
  requires :unattended_upgrades

  template = File.join(File.dirname(__FILE__), 'resources', '10periodic.txt.erb')
  config_dir = '/etc/apt/apt.conf.d'
  config_file = '10periodic'

  transfer template, "/tmp/#{config_file}", :render => true do
    post :install, "mv /tmp/#{config_file} #{config_dir}"
    post :install, "chown root #{File.join(config_dir, config_file)}"
    post :install, "chgrp root #{File.join(config_dir, config_file)}"
    post :install, "chmod 644 #{File.join(config_dir, config_file)}"
  end

  verify do
    file_contains File.join(config_dir, config_file), "Created by Sprinkle"
  end

end

package :unattended_upgrades do
  description 'Debian unattended-upgrades package'
  apt 'unattended-upgrades'
  verify do
    has_apt 'unattended-upgrades'
  end
end