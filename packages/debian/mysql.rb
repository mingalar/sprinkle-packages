# Version 5.5 is the current one as of ubuntu 12.04 and debian wheezy.
# On older distributions the mysql version may be different.

package :mysql_server_55, :provides => :database_server do
  description "MySQL database server 5.5"

  apt 'mysql-server-5.5'

  verify do
    has_apt 'mysql-server-5.5'
    has_process 'mysqld'
  end
end

package :mysql_client_55 do
  description "MySQL database client 5.5"

  apt 'mysql-client-5.5'

  verify do
    has_apt 'mysql-client-5.5'
  end
end

package :libmysqlclient_dev do
  description "MySQL database client library, development files"

  apt 'libmysqlclient-dev'

  verify do
    has_apt 'libmysqlclient-dev'
  end
end
