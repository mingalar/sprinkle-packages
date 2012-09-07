package :sqlite3 do
  description "SQLite3 file database & command-line client"

  apt 'sqlite3'

  verify do
    has_apt 'sqlite3'
  end
end

package :libsqlite3_dev do
  description "SQLite3 file database client library, development files"

  apt 'libsqlite3-dev'

  verify do
    has_apt 'libsqlite3-dev'
  end
end
