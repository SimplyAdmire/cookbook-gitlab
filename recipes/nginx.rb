package "nginx"

template "/etc/nginx/sites-enabled/gitlab" do
  source "gitlab-nginx.erb"
  owner "root"
  group "root"
  mode 0644
end