{% if 'mysql-cluster-id' in grains %}

{% from "mysql_server/files/map.jinja" import mysql with context %}

mysql_configure:
  file:
    - managed
    - name: {{ mysql.conf_file }}
    - source: salt://mysql_server/files/cluster.cnf
    - makedirs: True
    - replace: True
    - template: jinja
{% endif %}
