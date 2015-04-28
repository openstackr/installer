{% from "mysql_server/files/map.jinja" import mysql with context %}
{% from "cinder/controller/files/map.jinja" import cinder_controller with context %}

mysql_python_pkg:
  pkg.installed:
    - name: MySQL-python

cinder_db:
  mysql_database.present:
    - name: {{ cinder_controller.name }}
    - connection_host: {{ mysql.conn_host }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_password }}

{% for host_list in ['localhost', '"%"'] %}
cinder_{{ host_list }}:
  mysql_user.present:
    - name: {{ cinder_controller.name }}
    - password: {{ cinder_controller.password }}
    - host: {{ host_list }}
    - connection_host: {{ mysql.conn_host }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_password }}

  mysql_grants.present:
    - host: {{ host_list }}
    - grant: {{ mysql.privileges }}
    - database: '*.*'
    - user: {{ cinder_controller.name }} 
    - connection_host: {{ mysql.conn_host }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_password }}

{% endfor %}
  require:
      - pkg: mysql_python_pkg


