{% if 'role' in grains and salt['grains.get']('role') == 'rabbitmq' and 'rabbitmq-is-master' in grains and  salt['grains.get']('rabbitmq-is-master') == True %}

{% from "rabbitmq/files/map.jinja" import rabbitmq  with context %}

rabbitmq_user:
  rabbitmq_user.present:
    - name: {{ rabbitmq.rabbitmq_name }} 
    - password: {{ rabbitmq.rabbitmq_password }} 
    - perms:
      - '/':
        - '.*'
        - '.*'
        - '.*'



rabbitmq_user_admin:
  cmd.run:
    - name: rabbitmqctl set_user_tags {{ rabbitmq.rabbitmq_name }} administrator

rabbitmq_plugin:
  cmd.run:
    - name: rabbitmq-plugins enable rabbitmq_management rabbitmq_management_agent

{%- endif -%}
