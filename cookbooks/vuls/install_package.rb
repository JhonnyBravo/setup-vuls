APT_SOURCE="deb http://httpredir.debian.org/debian jessie-backports main"

directory "/var/log/vuls" do
  action :create
  owner "vuls"
  mode "700"
end

execute "add_apt_source" do
  not_if "grep -a 'jessie-backports' /etc/apt/sources.list"
  command "echo #{APT_SOURCE} >> /etc/apt/sources.list"
end

execute "apt_get_update" do
  command "apt-get update"
end

%w(git make gcc reboot-notifier).each do |pkg|
  package pkg do
    action :install
  end
end

directory "/home/vuls/go/src/github.com/kotakanbe" do
  action :create
  user "vuls"
end

directory "/home/vuls/go/src/github.com/future-architect" do
  action :create
  user "vuls"
end

# go-cve-dictionary
git "/home/vuls/go/src/github.com/kotakanbe/go-cve-dictionary" do
  action :sync
  user "vuls"
  repository "https://github.com/kotakanbe/go-cve-dictionary.git"
end

# goval-dictionary
git "/home/vuls/go/src/github.com/kotakanbe/goval-dictionary" do
  action :sync
  user "vuls"
  repository "https://github.com/kotakanbe/goval-dictionary.git"
end

# vuls
git "/home/vuls/go/src/github.com/future-architect/vuls" do
  action :sync
  user "vuls"
  repository "https://github.com/future-architect/vuls.git"
end
