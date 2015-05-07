cinder_config_file:
  file.managed:
    - name: "/etc/cinder/cinder.conf"
    - mode: 644
    - source: salt://cinder/controller/files/controller_cinder.conf
    - template: jinja

cinder_sync:
  cmd.run:
    - name: "cinder-manage db sync"
