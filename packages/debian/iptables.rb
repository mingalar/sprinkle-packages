package :iptables do
  description "iptables firewall"

  optional :iptables_init_d

  apt 'iptables'

  verify do
    has_apt 'iptables'
  end
end

package :iptables_init_d do
  description "init script for iptables"

  initscript = '/etc/init.d/iptables'
  iptablesrc = config(:IPTABLES_CONF, :default => '/etc/iptables.conf', :required => true)

  transfer File.join(File.dirname(__FILE__), 'resources', 'iptables.erb'), "/tmp/iptables",
           :render => true, :locals => {:iptablesrc => iptablesrc}, :sudo => true do
    post :install, "mv /tmp/iptables #{initscript}"
    post :install, "chmod +x #{initscript}"
    post :install, "update-rc.d #{File.basename(initscript)} defaults"
  end

  verify do
    has_executable initscript
    file_contains initscript, iptablesrc
  end
end
