{% from "mysql_server/files/map.jinja" import mysql with context %}
{% from "glance/files/map.jinja" import glance with context %}

nova_controller_db:
  mysql_database.present:
    - name: {{ glance.name }}
    - connection_host: {{ salt['publish.publish']('haproxy:*','grains.get','ipv4','grain').values()[0][1] }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_password }}
    - connection_charset: utf8
    - saltenv: 
        - LC_ALL: "en_US.utf8"
{% for host_list in ['localhost', '"%"'] %}
nova_controller_host_{{ host_list }}:
  mysql_user.present:
    - name: {{ glance.name }}
    - host: {{ host_list }}
    - password: {{ glance.password }}
    - connection_host: {{ salt['publish.publish']('haproxy:*','grains.get','ipv4','grain').values()[0][1] }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_password }}
  mysql_grants.present:
    - host: {{ host_list }}
    - grant: {{ mysql.privileges }}
    - database: '*.*'
    - user: {{ glance.name }}
    - connection_host: {{ salt['publish.publish']('haproxy:*','grains.get','ipv4','grain').values()[0][1] }}
    - connection_user: {{ mysql.conn_user }}
    - connection_pass: {{ mysql.conn_password }}
{% endfor %}

