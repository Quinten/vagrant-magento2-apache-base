vagrant-magento2-apache-base
============================

Quick and dirty Vagrant image for building Magento 2. The idea is you run
MySQL and Apache in a Vagrant 'box' (VM), but do all your development
using your normal tools on your desktop.

See http://vagrantup.com/ for Vagrant installation instructions.

Make sure to install the latest version of VirtualBox and VirtualBox Addons before proceeding.

To use, check out Magento 2 and this Vagrant files in sibling directories.
For example:

    cd myproject
    git clone https://github.com/magento/magento2.git
    git clone https://github.com/Quinten/vagrant-magento2-apache-base.git

The Vagrantfile mounts ../magento2 under /var/www/magento2.

You can edit using your local tools in your laptop/desktop etc. Go into the
'magento2' directory and edit away!

To start up the Vagrant image, go into 'vagrant-magento2-apache-base' and
run 'vagrant up'. It contains its own MySQL database and Apache web server.

    cd vagrant-magento2-apache-base
    vagrant up

When the Vagrant box has been built, you can ssh into it.

    vagrant ssh

Last thing we need to do is run a script from inside our vagrant box to deploy magento. This script wraps 3 things:
* run composer install
* install the sample data
* run the magento installation

    sh /vagrant/scripts/deploy.sh

Finally, access your site on your laptop/desktop using http://192.168.254.91/

See also
* Original repo: https://github.com/alankent/vagrant-magento2-apache-base
* Blog post https://alankent.wordpress.com/2014/12/21/reducing-magento-2-install-pain-through-virtualization/
* Alernative: with all files inside VM https://github.com/ryanstreet/magento2-vagrant
* Another one: https://github.com/rgranadino/mage2_vagrant, also using NFS for better hosting performance




