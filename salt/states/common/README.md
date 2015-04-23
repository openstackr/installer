# Usage

### common.grains

    salt * state.sls common.grains pillar='{"current-openstack-instance": "devcloud"}'

In this example ```devcloud``` is the value of ```openstack-instance``` and holds all the minions in that openstack instance. Below two minons are under ```devcloud```.

```/srv/salt/pillar/minion.sls```

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
