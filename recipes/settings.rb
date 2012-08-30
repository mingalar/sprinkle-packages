# Sprinkle Packages
# Defines the world of packages as we know it.
# Each package has a name and set of metadata,
# including its installer type (eg. apt, source, gem, etc).
# Packages can have relationships to each other via dependencies

require_relative './minimal'
require_relative '../packages/debian/hostname'
require_relative '../packages/debian/openssh'
require_relative '../packages/debian/vim'

# Sprinkle Policies
# Names a group of packages (optionally with versions) that apply to a particular set of roles.

policy :settings, :roles => :app do
  requires :hostname
  requires :openssh_authorized_keys if config(:OPENSSH_AUTHORIZED_KEYS)
  requires :openssh_disable_password_authentication if config(:OPENSSH_DISABLE_PASSWORD_AUTHENTICATION)
  requires :vim_system_vimrc if config(:VIM_SYSTEM_VIMRC)
end
