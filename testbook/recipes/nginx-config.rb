directory '/etc/nginx/ssl' do
  owner 'root'
  group 'root'
  mode '0640'
  action :create
end

cookbook_file '/etc/nginx/ssl/server.key' do
  source 'server.key'
  owner 'root'
  group 'root'
  mode '0600'
  action :create
end

cookbook_file '/etc/nginx/ssl/server.crt' do
  source 'server.crt'
  owner 'root'
  group 'root'
  mode '0600'
  action :create
end

template '/etc/nginx/sites-available/lamptest' do
  source 'nginx-site.erb'
  group 'root'
  owner 'root'
  mode 0644
end

link '/etc/nginx/sites-enabled/lamptest' do
  to '/etc/nginx/sites-available/lamptest'
end

service 'nginx' do
  action :reload
end