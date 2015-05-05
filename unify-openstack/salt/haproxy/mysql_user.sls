{% if 'haproxy' in grains and grains['haproxy'] == 'mysql' %}
{% from "mysql_server/files/map.jinja" import mysql with context %}

MySQL-python:
  pkg.installed

test_user:
  mysql_user.present:
    - name: test
    - host: {{ mysql.allow_host }}
    - password: test 
    - connection_host: {{ salt['grains.get']('ipv4')[1] }}
    - connection_user: {{ mysql.conn_user }} 
    - connection_pass: {{ mysql.conn_password }} 
  mysql_grants.present:
    - grant: {{ mysql.privileges }} 
    - database: '*.*'
    - user: test 
    - host: {{ mysql.allow_host }} 
    - grant_option: True
    - connection_host: {{ salt['grains.get']('ipv4')[1] }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_password }}
  require:
    - pkg : MySQL-python 
{% endif %}
