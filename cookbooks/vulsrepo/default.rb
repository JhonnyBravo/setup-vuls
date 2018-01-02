# vulsrepo
directory "/home/vuls/go/src/github.com/usiusi360" do
  action :create
  user "vuls"
end

git "/home/vuls/go/src/github.com/usiusi360/vulsrepo" do
  action :sync
  user "vuls"
  repository "https://github.com/usiusi360/vulsrepo.git"
end
