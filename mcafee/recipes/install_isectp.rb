#
# Cookbook:: mcafee
# Recipe:: install_isectp
#
# Copyright:: 2017, The Authors, All Rights Reserved.

bash 'install_isectp' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  wget https://nexus-gss.uscis.dhs.gov/nexus/repository/ISD-binaries/mcafee/ENS10_2/ISecTP-10.2.0-624-Release-standalone.tar.gz
  tar -zxvf ISecTP-10.2.0-624-Release-standalone.tar.gz
  sudo ./install-isectp.sh silent
  EOH
end
