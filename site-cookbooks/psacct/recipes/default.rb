#
# Cookbook Name:: psacct
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w[
  psacct
].each do |pkg|
  package "#{pkg}" do
    action :install
  end
end

service "psacct" do
  supports :restart => true, :reload => true
  action [:start, :enable]
end
