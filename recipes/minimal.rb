# Sprinkle Packages
# Defines the world of packages as we know it.
# Each package has a name and set of metadata,
# including its installer type (eg. apt, source, gem, etc).
# Packages can have relationships to each other via dependencies

require_relative '../packages/helper'
require_relative '../packages/debian/apt_enable_proxy'
require_relative '../packages/debian/apt_enable_auto_upgrades'
require_relative '../packages/debian/apt_update_index'
require_relative '../packages/debian/apt_upgrade'

# Sprinkle Policies
# Names a group of packages (optionally with versions) that apply to a particular set of roles.

policy :minimal, :roles => :app do
  requires :distro_package_proxy
  requires :distro_package_reindex
  requires :distro_package_upgrade
  requires :distro_auto_update
end
