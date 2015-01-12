name             'wp'
maintainer       'YOUR_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures wp'
long_description 'Installs/Configures wp'
version          '0.1.0'

depends 'nginx'
depends 'php5-fpm'
depends 'memcached', '~> 1.7.2'
depends 'mysql', '~> 6.0'

# not tested on other machines.
supports 'unbuntu'
