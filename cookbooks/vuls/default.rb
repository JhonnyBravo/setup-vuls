directory "/var/log/vuls" do
  action :create
  owner "vuls"
  mode "700"
end

template "/etc/profile.d/goenv.sh" do
  action :create
  mode "644"
  source "templates/goenv.sh"
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
