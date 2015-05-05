{% if 'role' in grains and grains['role'] == 'mysql' %}
mysql_stop:
  cmd:
    - run
    {%- for mysql_status in salt['cmd.run']('service mysql status').split() -%}
      {%- if mysql_status == 'SUCCESS!' %}
    - name: service mysql stop
      {%- elif mysql_status == 'ERROR!'  %}
    - name: echo "Mysql Server Instance is stopped"
      {%- endif -%}
    {%- endfor -%}
{% endif %}
