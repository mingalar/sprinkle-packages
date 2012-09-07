# rabbitmq package does not export rabbitmq-plugins to $PATH, use explicit path.
# note: rabbitmq-plugins is only available starting with rabbitmq-server 2.7.0
RABBITMQ_PLUGINS = '/usr/lib/rabbitmq/bin/rabbitmq-plugins'

# quick and dirty verifier to check for enabled rabbitmq plugins
module RabbitMQPluginVerifier
  Sprinkle::Verify.register(self)

  # Tests that the plugin is enabled
  def has_rabbitmq_plugin(plugin)
    @commands << "#{RABBITMQ_PLUGINS} list | grep '^\\[[Ee]\\] #{plugin} '"
  end
end

package :rabbitmq_server, :provides => :amqp_server do
  description "RabbitMQ AMQP server"

  apt 'rabbitmq-server'

  verify do
    has_apt 'rabbitmq-server'
    has_process 'beam.smp'
  end
end

package :librabbitmq_dev do
  description "RabbitMQ client library, development files"

  apt 'librabbitmq-dev'

  verify do
    has_apt 'librabbitmq-dev'
  end
end

package :rabbitmq_management do
  description "RabbitMQ server management plugin"

  requires :rabbitmq_server

  runner "#{RABBITMQ_PLUGINS} enable rabbitmq_management" do
    post :install, "service rabbitmq-server reload"
  end

  verify do
    has_rabbitmq_plugin 'rabbitmq_management'
  end
end

package :rabbitmq_stomp do
  description "RabbitMQ server stomp plugin"

  requires :rabbitmq_server

  runner "#{RABBITMQ_PLUGINS} enable rabbitmq_stomp" do
    post :install, "service rabbitmq-server reload"
  end

  verify do
    has_rabbitmq_plugin 'rabbitmq_stomp'
  end
end
