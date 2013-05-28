package "nginx"

template "/etc/nginx/sites-available/gitlab" do
  source "gitlab-nginx.erb"
  owner "root"
  group "root"
  mode 0644
end

link "/etc/nginx/sites-available/gitlab" do
  to "/etc/nginx/sites-enabled/gitlab"
end