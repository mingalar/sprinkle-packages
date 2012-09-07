package :tovid do
  description "tovid DVDs, VCDs, and SVCDs creation tool"

  apt 'tovid'

  verify do
    has_apt 'tovid'
  end
end
