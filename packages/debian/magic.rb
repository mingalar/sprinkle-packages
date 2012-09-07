package :file do
  description "'file' command to detect file types"

  apt 'file'

  verify do
    has_apt 'file'
  end
end

package :libmagic_dev do
  description "magic library, development files"

  apt 'libmagic-dev'

  verify do
    has_apt 'libmagic-dev'
  end
end
