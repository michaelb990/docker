#
# Cookbook Name:: mb-mesos-marathon-stack
# Recipe:: default
#
# Copyright (C) 2017 Socrata, Inc.
#
# All rights reserved - Do Not Redistribute
#

docker_service 'default' do
  insecure_registry 'registry.docker.aws-us-west-2-infrastructure.socrata.net:5000'
end

include_recipe 'zookeeper'
include_recipe 'zookeeper::service'
include_recipe 'mesos::master'
include_recipe 'mesos::slave'
include_recipe 'marathon'
include_recipe 'marathon::service'
