{% if 'role' in grains and grains['role'] == 'rabbitmq' %}
{% set HOSTNAME= salt['cmd.run']('env hostname') %}
{% if (HOSTNAME == 'localhost') or (HOSTNAME == 'localhost.virtusa.com') or (HOSTNAME == 'localhost.localdomain')  %}
   
rabbitmq_conf:
  file:
    - managed
    - name: /etc/rabbitmq/rabbitmq-env.conf
    - source: salt://rabbitmq/files/rabbitmq-env.conf
    - template: jinja
    - makedirs: True

file_hosts:
  file:
    - append
    - name: /etc/hosts
    - text:
      - {{ salt['grains.get']('ipv4')[1] }} {{ salt['grains.get']('id') }}

{% endif %}
{% endif %}

