# gitlab cookbook

This [Chef](http://www.opscode.com/chef/) cookbook recipe is created to:

1. Setup an Debian 7.0 server to be ready for [GitlabHQ](https://github.com/gitlabhq/gitlabhq)
2. Push the [5.1-stable branch](https://github.com/gitlabhq/gitlabhq/tree/5-1-stable) of Gitlab

I've separated it into two components because:

1. I wanted to better understand the [setup process](https://github.com/gitlabhq/gitlab-recipes/tree/master/install/master) from start to finish and build an idempotent Chef cookbook.
2. I like the ability to customize the configuration.

We've made a fork from Darron Froese's cookbook to be able to use if for Debian 7.0 and use Gitlab 5.1-stable.

# Requirements

Tested on Debian 7.0 using:

1. [Vagrant](http://www.vagrantup.com) *(todo)
2. [Rackspace Cloud](http://www.rackspace.com/cloud/)
3. VPS

You need to have Ruby 1.9.3-p327, Bundler and Chef already installed.

There's a Vagrant test vm available [here](https://dl.dropbox.com/u/695019/vagrant/precise-193p327.box).*(todo)

# Usage

1. Add your own ssh public keys to `templates/default/gitlab_authorized_keys.erb`
2. Add `recipe[gitlab]` to your node's runlist - run: `chef-client`
3. Edit `:domain` in `config/deploy.rb` and then: `cap deploy` (It may fail to "restart" at the end - that's OK.)
4. Edit `/home/gitlab/.pam_environment` - that's where the database username / passsword are kept.
5. `cap deploy:app_setup`
6. `cap deploy:start`
7. Browse to the ip address and sign in as the default user. (admin@local.host / 5iveL!fe) NOTE: You may need to give it a second to compile all of the assets and get spun up properly - if you see an Nginx 502 Gateway error give it a second.
8. Profit

# Attributes

# Recipes

# Author

Author:: Sebastiaan van Parijs (<svparijs@refactory.it>)

# Special thanks to:

Author:: Darron Froese (<darron@froese.org>)
