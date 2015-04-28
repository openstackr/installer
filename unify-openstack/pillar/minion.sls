# current-openstack-instance is expected to be give on the commandline
# if not, the value below will be used.
current-openstack-instance: devcloud

openstack-instance:
  devcloud:
    openstack-id: devcloud
    minions:
      controller:
        function: controller
        role: mysql
        mysql-cluster-id: mysql-cluster1
        mysql-is-master: true

      compute:
        function: compute
        role: mysql
        mysql-cluster-id: mysql-cluster1
        mysql-is-master: false

      network:
        function: network
        haproxy: mysql 

    openstack-components:
      keystone:
        name: keystone
        password: keystone_pass
        conn_token: admin

      mysql:
        conn_user: root
        conn_password: mysql
        conn_host: '172.25.204.94'
    
      rabbitmq:
        rabbitmq_username: rabbitmq
        rabbitmq_password: password 

      nova: 
        controller:
          name: nova
          password: nova_pass
          email: nova@test.com

        compute: 
          my_ip: localhost
          glance_host: controller
          virt_type: kvm 

      neutron:
        name: neutron
        password: neutron_pass

      cinder:
        name: cinder
        password: cinder_pass

 
