# Copyright 2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may not
# use this file except in compliance with the License. A copy of the License is
# located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is distributed on
# an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied. See the License for the specific language governing permissions
# and limitations under the License.

default['tomcat7']['base_version'] = 7
default['tomcat7']['port'] = 8080
default['tomcat7']['secure_port'] = 8443
default['tomcat7']['ajp_port'] = 8009
default['tomcat7']['shutdown_port'] = 8005
default['tomcat7']['uri_encoding'] = 'UTF-8'
default['tomcat7']['unpack_wars'] = true
default['tomcat7']['auto_deploy'] = true
case node[:platform]
when 'centos', 'redhat', 'fedora', 'amazon'
  default['tomcat7']['java_opts'] = ''
when 'debian', 'ubuntu'
  default['tomcat7']['java_opts'] = '-Djava.awt.headless=true -Xmx128m -XX:+UseConcMarkSweepGC'
end
default['tomcat7']['catalina_base_dir'] = "/etc/tomcat#{node['tomcat7']['base_version']}"
default['tomcat7']['webapps_base_dir'] = "/var/lib/tomcat#{node['tomcat7']['base_version']}/webapps"
default['tomcat7']['lib_dir'] = "/usr/share/tomcat#{node['tomcat7']['base_version']}/lib"
default['tomcat7']['java_dir'] = '/usr/share/java'
default['tomcat7']['mysql_connector_jar'] = 'mysql-connector-java.jar'
default['tomcat7']['apache_tomcat_bind_mod'] = 'proxy_http' # or: 'proxy_ajp'
default['tomcat7']['apache_tomcat_bind_config'] = 'tomcat_bind.conf'
default['tomcat7']['apache_tomcat_bind_path'] = '/tc/'
default['tomcat7']['webapps_dir_entries_to_delete'] = %w(config log public tmp)
case node[:platform]
when 'centos', 'redhat', 'fedora', 'amazon'
  default['tomcat7']['user'] = 'tomcat'
  default['tomcat7']['group'] = 'tomcat'
  default['tomcat7']['system_env_dir'] = '/etc/sysconfig'
when 'debian', 'ubuntu'
  default['tomcat7']['user'] = "tomcat#{node['tomcat7']['base_version']}"
  default['tomcat7']['group'] = "tomcat#{node['tomcat7']['base_version']}"
  default['tomcat7']['system_env_dir'] = '/etc/default'
end
