{% from "mysql_server/files/map.jinja" import mysql with context %}
{% from "nova/controller/files/map.jinja" import nova_controller with context %}

nova_controller_db:
  mysql_database.present:
    - name: {{ nova_controller.name }}
    - connection_host: {{ mysql.conn_host }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_password }}
{% for host_list in ['localhost', '"%"'] %}
nova_controller_host_{{ host_list }}:
  mysql_user.present:
    - name: {{ nova_controller.name }}
    - host: {{ host_list }}
    - password: {{ nova_controller.password }}
    - connection_host: {{ mysql.conn_host }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_password }}
  mysql_grants.present:
    - host: {{ host_list }}
    - grant: {{ mysql.privileges }} 
    - database: '*.*'
    - user: {{ nova_controller.name }}
    - connection_host: {{ mysql.conn_host }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_password }}
{% endfor %}
