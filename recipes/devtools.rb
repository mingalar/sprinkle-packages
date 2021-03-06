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
require_relative '../packages/debian/rabbitmq' if config(:LIBRABBITMQ_DEV)
require_relative '../packages/debian/xml' if config(:LIBXML_DEV) || config(:LIBXSLT_DEV)
require_relative '../packages/debian/imagemagick' if config(:LIBMAGICK_DEV)
require_relative '../packages/debian/magic' if config(:LIBMAGIC_DEV)

# Sprinkle Policies
# Names a group of packages (optionally with versions) that apply to a particular set of roles.

policy :devtools, :roles => :app do
  requires :vim
  requires :git
  requires :libmysqlclient_dev if config(:LIBMYSQL_DEV)
  requires :libmongoclient_dev if config(:LIBMONGO_DEV)
  requires :librabbitmq_dev if config(:LIBRABBITMQ_DEV)
  requires :libxml_dev if config(:LIBXML_DEV)
  requires :libxslt_dev if config(:LIBXSLT_DEV)
  requires :libmagick_dev if config(:LIBMAGICK_DEV)
  requires :libmagic_dev if config(:LIBMAGIC_DEV)
end
