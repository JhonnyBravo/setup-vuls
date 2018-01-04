require 'dotenv'
Dotenv.load

VERSION=ENV["VERSION"]
OS=ENV["OS"]

execute "get_package" do
  not_if "test -f go#{VERSION}.#{OS}.tar.gz"
  command "wget https://redirector.gvt1.com/edgedl/go/go#{VERSION}.#{OS}.tar.gz"
end

execute "install_package" do
  not_if "test -d /usr/loca/go"
  command "tar -C /usr/local -xzf go#{VERSION}.#{OS}.tar.gz"
end

execute "remove_package" do
  only_if "test -f go#{VERSION}.#{OS}.tar.gz"
  command "rm go#{VERSION}.#{OS}.tar.gz"
end
