haproxy:
  pkg.installed  


{% from "mysql_server/files/map.jinja" import mysql with context %}


haproxy_conf:
  file:
    - managed
    - name: {{ mysql.haconf }}
    - source: salt://mysql_server/files/haproxy.cfg
    - template: jinja
    - require:
      - pkg: haproxy


haproxy_start:
  service:
    - running
    - name: haproxy

