# define mysql connection parameters
mysql_connection_info = {
  :host     => "localhost",
  :username => "root",
  :password => node['mysql']['server_root_password']
}

# create the database
mysql_database node['gitlab']['db']['database'] do
  connection mysql_connection_info
  action :create
end

# create database user
mysql_database_user node['gitlab']['db']['user'] do
  connection mysql_connection_info
  password node['gitlab']['db']['password']
  database_name node['gitlab']['db']['database']
  privileges [:select,:update,:insert,:create,:alter,:drop,:delete]
  action :grant
end