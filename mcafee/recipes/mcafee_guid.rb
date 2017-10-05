#
# Cookbook:: mcafee
# Recipe:: mcafee_guid
#
# Copyright:: 2017, The Authors, All Rights Reserved.

file '/guid.sh' do
  content "/opt/McAfee/agent/bin/maconfig -enforce -noguid
/opt/McAfee/agent/bin/maconfig -start
/opt/McAfee/agent/bin/cmdagent -i
guid1=$(/opt/McAfee/agent/bin/cmdagent -i | grep GUID | awk '{ print $2}' )
/opt/McAfee/agent/bin/maconfig -enforce -noguid
/opt/McAfee/agent/bin/maconfig -start
/opt/McAfee/agent/bin/cmdagent -i
guid1=$(/opt/McAfee/agent/bin/cmdagent -i | grep GUID | awk '{ print $2}' )"		
  action :create
end

bash 'guid_comparison' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  if [ guid1 == guid2 ]
	then ehco "houston we have a problem" > /var/log/mcafee-is-broken.log
  	else echo "guid changed"
  fi 
  EOH
end
