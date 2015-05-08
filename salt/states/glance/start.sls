

openstack_glance_api:
  service.running:
    - enable: True
    - name: openstack-glance-api



openstack_glance_registry:
  service.running:
    - enable: True
    - name: openstack-glance-registry

