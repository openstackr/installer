include :
  - .database
  - .nova_user
  - .install 


/etc/nova/nova.conf:
  file.managed:
    - name: "/etc/nova/nova.conf"
    - source: salt://nova/controller/files/nova.conf
    - template: jinja
    - require:
      - pkg: openstack-controller

/etc/nova/api-paste.ini:
  file.managed:
    - name: "/etc/nova/api-paste.ini"
    - source: salt://nova/controller/files/api-paste.ini
    - template: jinja
    - require:
      - pkg: openstack-controller


nova_dbsync:
  cmd:
    - run
    - name: nova-manage db sync

