# get_vulsrepo_service.rb
# /lib/systemd/system/vulsrepo.service
# -> ~/Templates/vulsrepo/vulsrepo.service.erb

require 'dotenv'
Dotenv.load

USER_NAME=ENV["USER_NAME"]
SRC1="/lib/systemd/system/"
SRC2="/home/vuls/go/src/github.com/usiusi360/vulsrepo/server/scripts"
DST="/home/#{USER_NAME}/Templates/vulsrepo/"

directory DST do
  action :create
  user USER_NAME
  owner USER_NAME
  group USER_NAME
end

execute "get_vulsrepo_service" do
  only_if "test -f #{SRC1}vulsrepo.service"
  user USER_NAME
  command "cp #{SRC1}vulsrepo.service #{DST}vulsrepo.service.erb"
end

execute "get_vulsrepo_service_sample" do
  not_if "test -f #{SRC1}vulsrepo.service"
  user USER_NAME
  command "cp #{SRC2}vulsrepo.service #{DST}vulsrepo.service.erb"
end
