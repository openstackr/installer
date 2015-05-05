{% if 'role' in grains and salt['grains.get']('role') == 'rabbitmq' and 'rabbitmq-is-master' in grains and  salt['grains.get']('rabbitmq-is-master') == True %}

{% from "rabbitmq/files/map.jinja" import rabbitmq  with context %}

rabbit_user:
    rabbitmq_user.present:
        - name: {{ rabbitmq.rabbitmq_name }} 
        - password: {{ rabbitmq.rabbitmq_password }} 
        - perms:
          - '/':
            - '.*'
            - '.*'
            - '.*'

{%- endif -%}
