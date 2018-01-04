# get_vulsrepo_config_toml.rb
# /home/vuls/go/src/github.com/usiusi360/vulsrepo/server/vulsrepo-config.toml
# -> ~/Templates/vuls/vulsrepo-config.toml.erb

require 'dotenv'
Dotenv.load

USER_NAME=ENV["USER_NAME"]
SRC="/home/vuls/go/src/github.com/usiusi360/vulsrepo/server/"
DST="/home/#{USER_NAME}/Templates/vulsrepo/"

directory DST do
  action :create
  user USER_NAME
  owner USER_NAME
  group USER_NAME
end

execute "get_vulsrepo_config_toml" do
  only_if "test -f #{SRC}vulsrepo-config.toml"
  user USER_NAME
  command "cp #{SRC}vulsrepo-config.toml #{DST}vulsrepo-config.toml.erb"
end

execute "get_vulsrepo_config_toml_sample" do
  not_if "test -f #{SRC}vulsrepo-config.toml"
  user USER_NAME
  command "cp #{SRC}vulsrepo-config.toml.sample #{DST}vulsrepo-config.toml.erb"
end
