{% if 'role' in grains and grains['role'] == 'mysql' %}
{% from "mysql_server/files/map.jinja" import mysql with context %}

MySQL-python:
  pkg.installed


root_change_password:
  mysql_user.present:
    - name: {{ mysql.root_user }} 
    - password: {{ mysql.root_password }} 
    - connection_user: root
root_newuser:
  mysql_user.present:
    - name: {{ mysql.conn_user }} 
    - host: {{ mysql.allow_host }} 
    - password: {{ mysql.conn_password }} 
    - connection_user: {{ mysql.root_user }}
    - connection_pass: {{ mysql.root_password }} 
  mysql_grants.present:
    - grant: {{ mysql.privileges }}
    - database: '*.*'
    - user: {{ mysql.conn_user }} 
    - host: {{ mysql.allow_host }} 
    - grant_option: True
    - connection_user: {{ mysql.root_user }}
    - connection_pass: {{ mysql.root_password }} 
  require:
    - pkg: MySQL-python 
{% endif %}
