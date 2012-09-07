package :xmlstarlet do
  description "xmlstarlet utility"

  apt 'xmlstarlet'

  verify do
    has_apt 'xmlstarlet'
  end
end

package :libxml2_dev, :provides => :libxml_dev do
  description "LibXML2 library, development files"

  apt 'libxml2-dev'

  verify do
    has_apt 'libxml2-dev'
  end
end

package :libxslt1_dev, :provides => :libxslt_dev do
  description "LibXSLT1 library, development files"

  requires :libxml2_dev

  apt 'libxslt1-dev'

  verify do
    has_apt 'libxslt1-dev'
  end
end
