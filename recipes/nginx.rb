package "nginx"

template "/etc/nginx/sites-available/gitlab" do
  source "gitlab-nginx.erb"
  owner "root"
  group "root"
  mode 0644
end

bash "enable gitlab site to /etc/nginx/sites-enabled/gitlab" do
  user "root"
  group "root"
  cwd "/etc/nginx"
  code <<-EOH
    ln -s /etc/nginx/sites-available/gitlab /etc/nginx/sites-enabled/gitlab
  EOH
  not_if { FileTest.exists?("/etc/nginx/sites-available/gitlab") }
end

nginx_site 'default' do
  action :disable
end