package :mongodb_server do
  description "MongoDB database server 5.5"

  apt 'mongodb-server'

  verify do
    has_apt 'mongodb-server'
    has_process 'mongod'
  end
end

package :mongodb_clients do
  description "MongoDB database clients"

  apt 'mongodb-clients'

  verify do
    has_apt 'mongodb-clients'
  end
end

package :libmongoclient_dev do
  description "MongoDB database client library, development files"

  apt 'libmongo-client-dev'

  verify do
    has_apt 'libmongo-client-dev'
  end
end
