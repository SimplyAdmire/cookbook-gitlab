#
# Cookbook Name:: gitlab
# Recipe:: prerequisites
#
# Copyright (C) 2013 Sebastiaan van Parijs
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package "build-essential"
package "zlib1g-dev"
package "libyaml-dev"
package "libssl-dev"
package "libgdbm-dev"
package "libreadline-dev"
package "libncurses5-dev"
package "libffi-dev"
package "curl"
package "git-core"
package "openssh-server"
package "redis-server"
package "checkinstall"
package "libxml2-dev"
package "libxslt-dev"
package "libcurl4-openssl-dev"
package "libicu-dev"
package "python"
package "python-software-properties"

gem_package "bundler"