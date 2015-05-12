{% if 'role' in grains and grains['role'] == 'rabbitmq' %}
rabbitmq_restart:
  cmd:
    - script 
    - name: salt://rabbitmq/status.sh
{% endif %}
