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
