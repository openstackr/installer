{% if 'rabbitmq-cluster-id' in grains and 'rabbitmq-is-master' in grains and  salt['grains.get']('rabbitmq-is-master') == False %}
include:
  - rabbitmq.stop
  - rabbitmq.copy
  - rabbitmq.restart
  - rabbitmq.join
{% endif %}
