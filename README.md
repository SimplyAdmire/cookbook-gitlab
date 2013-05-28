# gitlab cookbook

This [Chef](http://www.opscode.com/chef/) cookbook recipe is created to:

1. Setup an Debian 7.0 and Ubuntu 12.10 server to be ready for [GitlabHQ](https://github.com/gitlabhq/gitlabhq)
2. Push the [5.2-stable branch](https://github.com/gitlabhq/gitlabhq/tree/5-2-stable) of Gitlab

I've separated it into two components because:

1. I wanted to better understand the [setup process](https://github.com/gitlabhq/gitlab-recipes/tree/master/install/master) from start to finish and build an idempotent Chef cookbook.
2. I like the ability to customize the configuration.

We've made a fork from Darron Froese's cookbook to be able to use it for Debian 7.0 and Ubuntu 12.10 with use Gitlab 5.2-stable.

# Requirements

Tested on Debian 7.0(need a special bootstrap currently) and Ubuntu 12.10 using:

1. [Vagrant](http://www.vagrantup.com) *(todo)
2. [Rackspace Cloud](http://www.rackspace.com/cloud/)

You need to have Ruby 1.9.3-p327, Bundler and Chef already installed.

There's a Vagrant test vm available [here](https://dl.dropbox.com/u/695019/vagrant/precise-193p327.box).

# Usage

1. Add `recipe[gitlab]` to your node's runlist - run: `chef-client`
2. Browse to the ip address and sign in as the default user. (admin@local.host / 5iveL!fe) NOTE: You may need to give it a second to compile all of the assets and get spun up properly - if you see an Nginx 502 Gateway error give it a second.
5. Profit

# Attributes

# Recipes

- gitlab::default
- gitlab::prerequisites
- gitlab::redis
- gitlab::postfix
- gitlab::users
- gitlab::mysql
- gitlab::nginx
- gitlab::gitlab-shell
- gitlab::gitlab

# Author

Author:: Sebastiaan van Parijs (<svparijs@refactory.it>)

#### Special thanks to:

Author:: Darron Froese (<darron@froese.org>)
