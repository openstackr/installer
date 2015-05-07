include :
  - .database
  - .install


glance_api:
  file.managed:
    - name: "/etc/glance/glance-api.conf"
    - source: salt://glance/files/glance-api.conf
    - template: jinja
    - require:
      - pkg: glance_packages

glance_registry:
  file.managed:
    - name: "/etc/glance/glance-registry.conf"
    - source: salt://glance/files/glance-registry.conf
    - template: jinja
    - require:
      - pkg: glance_packages


/var/lib/glance/images:
  file.directory:
    - user: glance
    - group: glance
    - recurse:
      - user
      - group


/var/log/glance/api.log:
  file.managed:
    - user: glance
    - group: glance


/var/log/glance:  
  file.directory:
    - user: glance
    - group: glance
    - recurse:
      - user
      - group





glance_dbsync:
  cmd.run:
    - name: glance-manage db_sync

