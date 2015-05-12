{% from "neutron/controller/files/map.jinja" import neutron_controller with context %}
{% from "mysql_server/files/map.jinja" import mysql with context %}

neutron_db:
  mysql_database.present:
    - name: {{ neutron_controller.name }}
    - connection_host: {{ salt['publish.publish']('haproxy:*','grains.get','ipv4','grain').values()[0][0] }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_password }}
{% for host_list in ['localhost', '"%"'] %}
neutron_controller_host_{{ host_list }}:
  mysql_user.present:
    - name: {{ neutron_controller.name }}
    - password: {{ neutron_controller.password }}
    - host: {{ mysql.allow_host }}
    - connection_host: {{ salt['publish.publish']('haproxy:*','grains.get','ipv4','grain').values()[0][0] }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_password }}
  mysql_grants.present:
    - host: {{ mysql.allow_host }} 
    - grant: {{ mysql.privileges }} 
    - database: '*.*' 
    - user: {{ neutron_controller.name }} 
    - connection_host: {{ salt['publish.publish']('haproxy:*','grains.get','ipv4','grain').values()[0][0] }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_password }}

{% endfor %}
