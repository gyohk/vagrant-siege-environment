#
# Cookbook Name:: profile
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file "profile-local.sh" do
  path "/etc/profile.d/profile-local.sh"
  owner "root"
  group "root"
  mode "0644"
end

cookbook_file "umask.sh" do
  path "/etc/profile.d/umask.sh"
  owner "root"
  group "root"
  mode "0644"
end

bash "reflesh_path" do
  code <<-EOC
    source /etc/profile
  EOC
  not_if "echo $PATH | grep /usr/local/bin"
end