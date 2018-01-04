# set_vulsrepo_config_toml.rb
# ~/Templates/vulsrepo/vulsrepo-config.toml.erb ->
# /home/vuls/go/src/github.com/usiusi360/vulsrepo/server/vulsrepo-config.toml

require 'dotenv'
Dotenv.load

USER_NAME=ENV["USER_NAME"]
DST="/home/vuls/go/src/github.com/usiusi360/vulsrepo/server/"
SRC="/home/#{USER_NAME}/Templates/vulsrepo/"

template "#{DST}vulsrepo-config.toml" do
  user "vuls"
  mode "644"
  source "#{SRC}vulsrepo-config.toml.erb"
end
