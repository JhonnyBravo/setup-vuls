# config.toml
include_recipe "../../cookbooks/vuls/set_config_toml.rb"

# goenv.sh
include_recipe "../../cookbooks/vuls/set_goenv_sh.rb"

# vulsrepo-config.toml
include_recipe "../../cookbooks/vulsrepo/set_vulsrepo_config_toml.rb"

# vulsrepo.service
include_recipe "../../cookbooks/vulsrepo/set_vulsrepo_service.rb"
