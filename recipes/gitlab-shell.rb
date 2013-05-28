#https://github.com/gitlabhq/gitlab-shell

git "/home/git/gitlab-shell" do
    repository "git://github.com/gitlabhq/gitlab-shell.git"
    revision "v1.4.0"
    action :sync
    user "git"
    group "git"
end


template "/home/git/gitlab-shell/config.yml" do
  source "gitlab-shell.yml.erb"
  owner "git"
  group "git"
  mode 0644
end

script "gitlab-shell install" do
  interpreter "bash"
  user "git"
  cwd "/home/git/gitlab-shell"
  code <<-EOH
   bin/install
  EOH
end