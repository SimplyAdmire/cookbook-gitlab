name             "gitlab"
maintainer       "Sebastiaan van Parijs"
maintainer_email "svparijs@refactory.it"
license          "All rights reserved"
description      "Installs/Configures gitlab"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "apt"
depends "sudo"
depends "database"
