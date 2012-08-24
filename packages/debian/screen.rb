package :screen do
  description "screen"

  apt 'screen'

  verify do
    has_apt 'screen'
  end
end
