# Sprinkle Packages
# Defines the world of packages as we know it.
# Each package has a name and set of metadata,
# including its installer type (eg. apt, source, gem, etc).
# Packages can have relationships to each other via dependencies

require_relative './minimal'
require_relative '../packages/debian/vim'
require_relative '../packages/debian/git'
require_relative '../packages/debian/mysql' if config(:LIBMYSQL_DEV)
require_relative '../packages/debian/mongo' if config(:LIBMONGO_DEV)

# Sprinkle Policies
# Names a group of packages (optionally with versions) that apply to a particular set of roles.

policy :devtools, :roles => :app do
  requires :vim
  requires :git
  requires :libmysqlclient_dev if config(:LIBMYSQL_DEV)
  requires :libmongoclient_dev if config(:LIBMONGO_DEV)
end
