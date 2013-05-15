# "git" group and user.

group "git"

# sudo adduser --disabled-login --gecos 'GitLab CI' gitlab_ci
# how to disable-login?
user "git" do
  comment "Git Version Control & GitLab User"
  gid "git"
  home "/home/git"
  shell "/bin/sh"
  supports :manage_home => true
end

directory "/home/git/bin" do
  owner "git"
  group "git"
  mode 00755
  action :create
end

directory "/home/git/repositories" do
  owner "git"
  group "git"
  mode 06775
  action :create
end

template "/home/git/.profile" do
  source "git_profile.erb"
  owner "git"
  group "git"
  mode 0644
end

["/home/git/public", "/home/git/public/uploads", "/home/git/gitlab-satellites", "/home/git/gitlab/config"].each do |dir|
  directory dir do
    owner "git"
    group "git"
    mode 0775
    not_if { FileTest.exists?("#{dir}") }
  end
end

template "/home/git/.pam_environment" do
  source "pam_environment.erb"
  owner "git"
  group "git"
  mode 0750
  not_if { FileTest.exists?("/home/git/.pam_environment") }
end

group "git" do
  members ['git']
end

# nonfiction standard.
group "deploy" do
  members "git"
  append true
end

generate_ssh_keys "git"

template "/home/git/.ssh/config" do
  source "ssh_config.erb"
  owner "git"
  group "git"
  mode 0644
end

template "/home/git/.ssh/authorized_keys" do
  source "gitlab_authorized_keys.erb"
  owner "git"
  group "git"
  mode 0600
end

bash "copy public key" do
  user "root"
  group "root"
  cwd "/home/git"
  code <<-EOH
    cp /home/git/.ssh/id_dsa.pub /home/git/gitlab.pub
    chmod 0444 gitlab.pub
  EOH
  not_if { FileTest.exists?("/home/git/gitlab.pub") }
end

template "/home/git/.gitconfig" do
  source "gitlab_git_config.erb"
  owner "git"
  group "git"
  mode 0644
end

sudo 'git' do
  user "git"
  runas 'root'
  commands ['/usr/sbin/service gitlab restart', '/usr/sbin/service nginx restart', '/usr/sbin/service gitlab start', '/usr/sbin/service nginx start', '/usr/sbin/service gitlab stop', '/usr/sbin/service nginx stop']
  nopasswd true
end