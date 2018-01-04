# get_goenv_sh.rb
# /etc/profile.d/goenv.sh -> ~/Templates/vuls/goenv.sh.erb

require 'dotenv'
Dotenv.load

USER_NAME=ENV["USER_NAME"]
SRC="/etc/profile.d/"
DST="/home/#{USER_NAME}/Templates/vuls/"

directory DST do
  action :create
  user USER_NAME
  owner USER_NAME
  group USER_NAME
end

execute "get_goenv_sh" do
  only_if "test -f #{SRC}goenv.sh"
  user USER_NAME
  command "cp #{SRC}goenv.sh #{DST}goenv.sh.erb"
end
