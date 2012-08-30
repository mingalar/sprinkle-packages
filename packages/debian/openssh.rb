package :openssh do
  description "OpenSSH server with authorized_keys"

  apt 'openssh-server'

  verify do
    has_apt 'openssh-server'
  end
end

package :openssh_disable_password_authentication do
  description "Disables ssh tunnelled cleartext passwords"

  sshd_config = '/etc/ssh/sshd_config'

  requires :openssh
  requires :openssh_authorized_keys

  runner "sed -E -i -e 's/^.*PasswordAuthentication (yes|no)/PasswordAuthentication no/g' #{sshd_config}" do
    post :install, "service ssh restart"
  end

  verify do
    file_contains sshd_config, '^PasswordAuthentication no'
  end
end

package :openssh_authorized_keys do
  description "Installs default OpenSSH authorized_keys for deploy_account (not for root)"

  deploy_account = config(:OPENSSH_USER_ACCOUNT, :required => true) # set in install.rb
  authorized_keys = "~#{deploy_account}/.ssh/authorized_keys"
  authorized_keys_src = config(:OPENSSH_AUTHORIZED_KEYS, :required => true, :default => authorized_keys)

  template = File.join(File.dirname(__FILE__), 'resources', 'authorized_keys.txt.erb')
  authorized_keys_content = File.read(File.expand_path(authorized_keys_src)).strip
  timestamp = Time.now.strftime('%d %B %Y %H:%M')

  transfer template, '/tmp/authorized_keys', :sudo => true, :render => true,
           :locals => {:timestamp => timestamp, :authorized_keys => authorized_keys_content} do
    post :install, "mkdir -p #{File.dirname(authorized_keys)}" # created as root when Capistrano use_sudo is set
    post :install, "mv /tmp/authorized_keys #{authorized_keys}"
    post :install, "chmod 644 #{authorized_keys}"
    post :install, "chown -R #{deploy_account}: #{File.dirname(authorized_keys)}"
  end

  verify do
    has_file authorized_keys
    file_contains authorized_keys, "^# Begin Sprinkle block #{timestamp}$"
    file_contains authorized_keys, "^# End Sprinkle block #{timestamp}$"
  end
end
