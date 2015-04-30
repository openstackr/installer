openstack_cinder_volume:
  service.running:
    - enable: True
    - name: openstack-cinder-volume
target_service:
  service.running:
    - enable: True
    - name: target
