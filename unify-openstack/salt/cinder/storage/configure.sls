lvm2_service:
  service.running:
    - enable: True
    - name: lvm2-lvmetad

cinder_storage_config_file:
  file.managed:
    - name: "/etc/cinder/cinder.conf"
    - mode: 644
    - source: salt://cinder/storage/files/storage_cinder.conf
    - template: jinja
