#
# Cookbook Name:: i2d_web
# Recipe:: core
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package 'apache2'

service 'apache2' do
  action [ :enable, :start ]
end

file '/var/www/html/index.html' do
    content "<h1>Welcome to DevOpsDC</h1>"
    owner "www-data"
end
