include :
  - .database
  - .install


/etc/keystone:
  file.managed:
    - name: "/etc/keystone/keystone.conf"
    - source: salt://keystone/files/keystone.conf
    - template: jinja
    - user: keystone
    - group: keystone
    - require:
      - pkg: openstack-keystone

keystone_manage:
  cmd:
    - run
    - name: keystone-manage pki_setup --keystone-user keystone --keystone-group keystone
    
/etc/keystone/ssl:
  file.directory:
    - user: keystone
    - group: keystone
    - mode: 660
    - recurse:
      - user
      - group
      - mode

/var/log/keystone:
  file.directory:
     - user: keystone
     - group: keystone
     - recurse:
       - user
       - group

keystone_dbsync:
  cmd:
    - run
    - name: keystone-manage db_sync


