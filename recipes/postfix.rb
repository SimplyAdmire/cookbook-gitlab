# TODO: Look into the Chef::Exceptions::Exec
# 10.10.0.28 apt-get -q -y install postfix-policyd-spf-python=1.0-2 returned 100, expected 0
# POSTFIX
# https://github.com/gitlabhq/gitlab-recipes/blob/5-1-stable/install/v4/ubuntu_server_1204.sh#L67
# sudo DEBIAN_FRONTEND='noninteractive' apt-get install -y postfix-policyd-spf-python postfix # Install postfix without prompting.
package "postfix-policyd-spf-python"
package "postfix"