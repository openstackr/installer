# current-openstack-instance is expected to be give on the commandline
# if not, the value below will be used.
current-openstack-instance: devcloud

openstack-instance:
  devcloud:
    openstack-id: devcloud
    minions:
      server1:
        role: mysql
        mysql-cluster-id: cluster1
        mysql-is-master: true
      server2:
        role: mysql
        mysql-cluster-id: cluster1
        mysql-is-master: false
  testcloud:
    openstack-id: devcloud
    minions:
      server1:
        role: mysql
        mysql-cluster-id: cluster2
        mysql-is-master: True
