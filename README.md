testbook Cookbook
=================

Cookbook prepares:

* Apache2 + mod_php (listens on port 8888)
* Tomcat 8 + jenkins.war (listens on port 8080)
* Nginx as reverse proxy for both Apache and Tomcat (listens on port 80)
* Ports 8080 and 8888 restricted by iptables to listen on localhost only


Pre-requisites to install/test:

* Install vagrant 1.8.1(some older versions could work well too)
* Install virtualbox 5.0
* Add **10.10.10.10 lamptest** record to /etc/hosts file on your host system
* Clone repository to your home directory:

  $ cd ~ && git clone https://github.com/devopsman/testbook

* Change to directory with repository, create cookbooks dir and run vagrant VM:

  $ cd ~/testbook && mkdir cookbooks && vagrant up

* After VM started and provisioned, check VM by testing next URLs:
 - https://lamptest - should be showing phpinfo.php as default index page
 - http://lamptest - should redirect to ssl site above
 - https://lamptest/jenkins - to access Jenkins page


Testing cookbook - foodcritic tests passed.

* $ gem install foodcritic
* $ foodcritic testbook
