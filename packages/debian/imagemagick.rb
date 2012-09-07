package :imagemagick do
  description "ImageMagick command-line tools"

  apt 'imagemagick'

  verify do
    has_apt 'imagemagick'
  end
end

package :libmagick_dev do
  description "Magic++ library, development files"

  apt 'libmagick++-dev'

  verify do
    has_apt 'libmagick++-dev'
  end
end
