# Sprinkle Packages
# Defines the world of packages as we know it.
# Each package has a name and set of metadata,
# including its installer type (eg. apt, source, gem, etc).
# Packages can have relationships to each other via dependencies

require_relative './minimal'
require_relative '../packages/debian/rabbitmq'

# Sprinkle Policies
# Names a group of packages (optionally with versions) that apply to a particular set of roles.

policy :rabbitmq, :roles => :app do
  requires :rabbitmq_server
end
