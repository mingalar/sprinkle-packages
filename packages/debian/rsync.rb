package :rsync do
  description "rsync"

  apt 'rsync'

  verify do
    has_apt 'rsync'
  end
end
