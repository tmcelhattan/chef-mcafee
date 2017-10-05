#
# Cookbook:: mcafee
# Recipe:: install_mcafee
#
# Copyright:: 2017, The Authors, All Rights Reserved

bash 'install_mcafee' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  wget https://nexus-gss.uscis.dhs.gov/nexus/repository/ISD-binaries/mcafee/agent/linux_ma_v506_install.sh
  chmod +x linux_ma_v506_install.sh
  ./linux_ma_v506_installinstall.sh -i
  EOH
end
