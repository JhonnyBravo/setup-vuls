# set_config_toml.rb
# ~/Templates/vuls/config.toml.erb -> /home/vuls/config.toml

require 'dotenv'
Dotenv.load

USER_NAME=ENV["USER_NAME"]
DST="/home/vuls/"
SRC="/home/#{USER_NAME}/Templates/vuls/"

template "#{DST}config.toml" do
  user vuls
  mode "644"
  source "#{SRC}config.toml.erb"
end
