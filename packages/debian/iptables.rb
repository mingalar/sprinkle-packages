package :iptables do
  description "iptables firewall"

  optional :iptable_init_d

  apt 'iptables'

  verify do
    has_apt 'iptables'
  end
end

package :iptables_init_d do
  description "init script for iptables"
  requires :iptables

  initscript = '/etc/init.d/iptables'
  IPTABLESRC = config(:IPTABLES_CONF, :default => '/etc/iptables.conf', :required => true)

  transfer File.join(File.dirname(__FILE__), 'resources', 'iptables.erb'), "/tmp/iptables", :render => true, :sudo => true do
    post :install, "mv /tmp/iptables #{initscript}"
    post :install, "chmod +x #{initscript}"
    post :install, "update-rc.d #{File.basename(initscript)} defaults"
  end

  verify do
    has_executable initscript
    file_contains initscript, IPTABLESRC
  end
end
