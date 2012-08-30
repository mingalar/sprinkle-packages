require_relative 'apt_cacher_ng'

package :apt_enable_proxy, :provides => :distro_package_proxy do
  description 'Enable proxy to download system packages'

  apt_cacher_ng_port = Integer(config(:APT_CACHER_NG_PORT, :required => true, :default => 3142))
  apt_proxy_host = config(:APT_PROXY_HOST, :required => true, :default => 'localhost')
  apt_proxy_port = Integer(config(:APT_PROXY_PORT, :required => true, :default => apt_cacher_ng_port))

  requires :apt_cacher_ng if apt_proxy_host == 'localhost' && apt_proxy_port == apt_cacher_ng_port

  template = File.join(File.dirname(__FILE__), 'resources', '00apt-proxy.txt.erb')
  config_dir = '/etc/apt/apt.conf.d'
  config_file = '00apt-proxy'

  transfer template, "/tmp/#{config_file}", :render => true,
           :locals => {:apt_proxy_host => apt_proxy_host, :apt_proxy_port => apt_proxy_port} do
    post :install, "mv /tmp/#{config_file} #{config_dir}"
    post :install, "chown root #{File.join(config_dir, config_file)}"
    post :install, "chgrp root #{File.join(config_dir, config_file)}"
    post :install, "chmod 644 #{File.join(config_dir, config_file)}"
  end

  verify do
    file_contains File.join(config_dir, config_file), "Created by Sprinkle"
    file_contains File.join(config_dir, config_file), "::Proxy \"http://#{apt_proxy_host}:#{apt_proxy_port}/\";$"
  end

end
