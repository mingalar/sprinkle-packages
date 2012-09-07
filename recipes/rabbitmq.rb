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
  requires :rabbitmq_management if config(:RABBITMQ_PLUGIN_MANAGEMENT)
  requires :rabbitmq_stomp if config(:RABBITMQ_PLUGIN_STOMP)
end
