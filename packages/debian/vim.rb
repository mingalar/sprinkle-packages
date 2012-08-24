package :vim do
  description "vim"

  apt 'vim'

  verify do
    has_apt 'vim'
  end
end
