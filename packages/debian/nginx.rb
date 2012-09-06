package :nginx, :provides => :web_server do
  description "nginx web server"

  apt 'nginx'

  verify do
    has_apt 'nginx'
  end
end
