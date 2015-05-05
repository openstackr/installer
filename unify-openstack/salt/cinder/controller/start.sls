openstack_cinder_api:
  service.running:
    - enable: True
    - name: openstack-cinder-api

openstack_cinder_scheduler:
  service.running:
    - enable: True
    - name: openstack-cinder-scheduler
