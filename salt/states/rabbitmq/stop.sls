{% if 'role' in grains and grains['role'] == 'rabbitmq' %}

rabbitmq_stop:
  cmd:
    - run
    - name: salt-call service.stop rabbitmq-server
{% endif %}
