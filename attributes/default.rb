default['gitlab']['host'] = 'git.simplyadmire.com'
default['gitlab']['port'] = '80'
default['gitlab']['ssl'] = false

default['gitlab']['default_project_limit'] = 10

default['gitlab']['email'] = 'support@simplyadmire.com'

default['gitlab']['db']['database'] = 'gitlabhq_production'
default['gitlab']['db']['user'] = 'gitlab'
default['gitlab']['db']['password'] = 'P@ssw0rd'

default['nginx']['default_site_enabled'] = false

default['mysql']['server_root_password'] = 'securerootpassword'