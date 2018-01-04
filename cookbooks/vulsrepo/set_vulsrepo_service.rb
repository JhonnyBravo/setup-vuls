# set_vulsrepo_service.rb
# ~/Templates/vulsrepo/vulsrepo.service.erb ->
# /lib/systemd/system/vulsrepo.service

require 'dotenv'
Dotenv.load

USER_NAME=ENV["USER_NAME"]
DST="/lib/systemd/system/"
SRC="/home/#{USER_NAME}/Templates/vulsrepo/"

template "#{DST}vulsrepo.service" do
  mode "644"
  source "#{SRC}vulsrepo.service.erb"
end
