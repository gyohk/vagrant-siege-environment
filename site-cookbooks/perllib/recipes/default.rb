#
# Cookbook Name:: perllib
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w[
  gcc
  make
  openssl-devel
  perl-CPAN
  perl-CGI
  perl-GD
  perl-YAML
  perl-URI
  perl-HTML-Parser
].each do |pkg|
  package "#{pkg}" do
    action :install
  end
end


script "install_siege" do
  interpreter "bash"
  user        "root"
  code <<-EOL
    cd /usr/local/src/
    wget http://download.joedog.org/siege/siege-latest.tar.gz
    tar zxvf ./siege-latest.tar.gz
    rm -f siege-latest.tar.gz
    cd siege-3.*/
    ./configure && make
    sudo make install
    cp -f doc/siegerc ~/.siegerc
  EOL
end

script "install_sproxy" do
  interpreter "bash"
  user        "root"
  code <<-EOL
    cd /usr/local/src/
    wget http://download.joedog.org/sproxy/sproxy-latest.tar.gz
    tar zxvf ./sproxy-latest.tar.gz
    rm -f sproxy-latest.tar.gz
    cd sproxy-1.*/
    ./configure && make
    sudo make install
  EOL
end


