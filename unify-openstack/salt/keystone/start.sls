keystone_service_start:
  service:
    - running
    - name: openstack-keystone
    - enable: True
    - restart: True
