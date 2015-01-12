## A Work in Progress Vagrant environment for Wordpress.

### Currently Not Working ###

Uses Ubuntu 14.04, Nginx, PHP5-FPM, and MySQL

## To Run

#### You need Vagrant and the ChefDK, along with some vagrant plugins:
- The easiest way to get ChefDK is to use [Caskroom.io](http://www.caskroom.io) and do `brew cask install chefdk`. Otherwise you can get it from [here](https://downloads.chef.io/chef-dk/)

You will also need these vagrant plugins.
- [Vagrant Hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater)
- [Vagrant Chef Omnibus Plugin](https://github.com/opscode/vagrant-omnibus)
- [Vagrant Berkshelf Plugin](https://github.com/berkshelf/vagrant-berkshelf)

Once you have all that installed, `cd` into your working directory, run `berks install` and then `vagrant up`