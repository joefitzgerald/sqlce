#
# Cookbook Name:: sqlce
# Recipe:: default
#
# Copyright (C) 2013 Joe Fitzgerald
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

windows_reboot 5 do
  reason 'SQL CE 4.0 SP1 Install Complete'
  action :nothing
end

# Install Visual Studio
windows_package node['sqlce']['4.0']['package_name'] do
  source node['sqlce']['4.0']['url']
  installer_type :custom
  options "/Q /I REBOOT=R"
  action :install
  # notifies :request, "windows_reboot[5]"
end