{% if 'role' in grains and grains['role'] == 'rabbitmq' %}
rabbitmq_start:
  cmd:
    - run
    - names: 
      - salt-call service.start rabbitmq-server 
      - salt-call cp.push /var/lib/rabbitmq/.erlang.cookie

{% endif %}

