# set_goenv_sh.rb
# ~/Templates/vuls/goenv.sh.erb -> /etc/profile.d/goenv.sh

require 'dotenv'
Dotenv.load

USER_NAME=ENV["USER_NAME"]
DST="/etc/profile.d/"
SRC="/home/#{USER_NAME}/Templates/vuls/"

template "#{DST}goenv.sh" do
  mode "644"
  source "#{SRC}goenv.sh.erb"
end
