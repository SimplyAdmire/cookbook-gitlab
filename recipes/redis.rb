package "redis-server"

service "redis-server" do
  service_name "redis-server"
  restart_command "/usr/sbin/service redis-server restart"
  action [:start, :enable]
end