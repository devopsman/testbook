tomcat_install 'jenkins' do
  version '8.0.32'
  install_path '/var/tomcat8'
end

tomcat_service 'jenkins' do
  action :start
end