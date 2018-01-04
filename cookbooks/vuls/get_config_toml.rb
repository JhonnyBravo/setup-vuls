# get_config_toml.rb
# /home/vuls/config.toml -> ~/Templates/vuls/config.toml.erb

require 'dotenv'
Dotenv.load

USER_NAME=ENV["USER_NAME"]
SRC="/home/vuls/"
DST="/home/#{USER_NAME}/Templates/vuls/"

directory DST do
  action :create
  user USER_NAME
  owner USER_NAME
  group USER_NAME
end

execute "get_config_toml" do
  only_if "test -f #{SRC}config.toml"
  user USER_NAME
  command "cp #{SRC}config.toml #{DST}config.toml.erb"
end
