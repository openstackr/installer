{% if 'role' in grains and grains['role'] == 'mysql' %}
{% from "mysql_server/files/map.jinja" import mysql with context %}

MySQL-python:
  pkg.installed


test_newuser:
  mysql_user.present:
    - name: test
    - host: {{ mysql.allow_host }}
    - password: test
    - connection_host: {{ salt['publish.publish']('haproxy:*','grains.get','ipv4','grain').values()[0][1] }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_password }}
  mysql_grants.present:
    - grant: {{ mysql.privileges }}
    - database: '*.*'
    - user: test
    - host: {{ mysql.allow_host }}
    - grant_option: True
    - connection_host: {{ salt['publish.publish']('haproxy:*','grains.get','ipv4','grain').values()[0][1] }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_password }}

  require:
    - pkg: MySQL-python
{% endif %}
