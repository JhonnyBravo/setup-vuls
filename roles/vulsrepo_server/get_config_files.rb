# config.toml
include_recipe "../../cookbooks/vuls/get_config_toml.rb"

# goenv.sh
include_recipe "../../cookbooks/vuls/get_goenv_sh.rb"

# vulsrepo-config.toml
include_recipe "../../cookbooks/vulsrepo/get_vulsrepo_config_toml.rb"

# vulsrepo.service
include_recipe "../../cookbooks/vulsrepo/get_vulsrepo_service.rb"
