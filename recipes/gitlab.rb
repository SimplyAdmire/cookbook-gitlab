# TODO: Cloning is not working properly
# http://docs.opscode.com/resource_deploy.html#DeployResource-SCMResources
# or
# http://docs.opscode.com/resource_git.html
deploy "/home/git/gitlab" do
  repo "https://github.com/gitlabhq/gitlabhq.git"
  revision "5-2-stable"
  user "git"
  group "git"
end

#git "/home/git/gitlab" do
#    repository "https://github.com/gitlabhq/gitlabhq.git"
#    revision "5-2-stable"
#    action :sync
#    user "git"
#    group "git"
#end

["/home/git/gitlab/config", "/home/git/gitlab/tmp", "/home/git/gitlab/tmp/socket"].each do |dir|
  directory dir do
    owner "git"
    group "git"
    mode 0775
    not_if { FileTest.exists?("#{dir}") }
  end
end


# Install the init script.
template "/etc/init.d/gitlab" do
  source "gitlab-init.erb"
  owner "root"
  group "root"
  mode 0755
end

# Install the configs.
cookbook_file "/home/git/gitlab/config/database.yml" do
  source "database.yml"
  owner "git"
  group "git"
  mode 0644
end

template "/home/git/gitlab/config/gitlab.yml" do
  source "gitlab.yml.erb"
  owner "git"
  group "git"
  mode 0644
end

template "/home/git/gitlab/config/puma.rb" do
  source "puma.erb"
  owner "git"
  group "git"
  mode 0644
end

# Fixes missing requirement mkmf
#
# http://stackoverflow.com/questions/7645918/require-no-such-file-to-load-mkmf-loaderror
#
package "ruby1.9.1-dev"

gem_package "rake"

gem_package "charlock_holmes" do
  options("--version '0.6.9.4'")
end

# TODO: Breaks aswell
# For MySQL (note, the option says "without")
script "bundler install" do
  interpreter "bash"
  user "git"
  cwd "/home/git/gitlab"
  code <<-EOH
   bundle install --deployment --without development test postgres
  EOH
end

# TODO:
# sudo -u gitlab -H git config --global user.name "GitLab"
# sudo -u gitlab -H git config --global user.email "gitlab@localhost"
# Generate the SSH key
# sudo -H -u gitlab ssh-keygen -q -N '' -t rsa -f /home/gitlab/.ssh/id_rsa


# Run installation script
script "bundle exec setup" do
  interpreter "bash"
  user "git"
  cwd "/home/git/gitlab"
  code <<-EOH
	bundle exec rake gitlab:setup RAILS_ENV=production
  EOH
end

# Run show config script
script "bundle exec environment config" do
  interpreter "bash"
  user "git"
  cwd "/home/git/gitlab"
  code <<-EOH
	bundle exec rake gitlab:env:info RAILS_ENV=production
  EOH
end

# Run check config script
script "bundle exec check config" do
  interpreter "bash"
  user "git"
  cwd "/home/git/gitlab"
  code <<-EOH
	bundle exec rake gitlab:check RAILS_ENV=production
  EOH
end

service "gitlab" do
  supports :restart => true, :start => true, :stop => true, :reload => true
  action [ :enable]
end

service "nginx" do
  supports :restart => true, :start => true, :stop => true, :reload => true
  action [ :enable]
end