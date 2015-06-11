{% if 'role' in grains and grains['role'] == 'rabbitmq' %}

rabbitmq_conf:
  file:
    - managed
    - name: /etc/rabbitmq/rabbitmq-env.conf
    - source: salt://rabbitmq/files/rabbitmq-env.conf
    - template: jinja
    - makedirs: True

rabbitmq_service_start:
  cmd.run:
    - name: salt-call service.start rabbitmq-server


rabbitmq_service_copy_cookie:
  cmd.wait:
    - name: salt-call cp.push /var/lib/rabbitmq/.erlang.cookie
    - watch:
      - cmd: rabbitmq_service_start  


rabbitmq_service_enable:
  service.enabled:
    - name: rabbitmq-server

{% endif %}
