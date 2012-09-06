package :git do
  description "git"

  apt 'git'

  verify do
    has_apt 'git'
  end
end
