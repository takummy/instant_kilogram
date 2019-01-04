server '13.231.3.132', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/takumih/.ssh/id_rsa'