{% if 'rabbitmq-cluster-id' in grains and 'rabbitmq-is-master' in grains and  salt['grains.get']('rabbitmq-is-master') == False %}

rabbitmq_service_stop:
  cmd.run:
    - name: salt-call service.stop rabbitmq-server


rabbitmq_service_getmasterfile:
  file.managed:
    - name: /var/lib/rabbitmq/.erlang.cookie
    - template: jinja
    - source: salt://{{salt['publish.publish']('rabbitmq-is-master:True','grains.get','id','grain').values()[0]}}/var/lib/rabbitmq/.erlang.cookie
    - makedirs: True

rabbitmq_master_config:
  file:
    - append
    - name: /etc/hosts
    - text:
      {%- for master,value in salt['mine.get']('G@rabbitmq-cluster-id:' + grains['rabbitmq-cluster-id'] + ' and G@role:' + grains['role'] + ' and G@rabbitmq-is-master:true','grains.items','compound').items() %}
      - {{ value['ipv4'][0] }} {{ value['host'] }}
      {% endfor %}

rabbitmq_slave_plugin:
  cmd.run:
    - name: rabbitmq-plugins enable rabbitmq_management rabbitmq_management_agent

rabbitmq_service_restart:
  cmd.run:
    - name: salt-call service.restart rabbitmq-server


rabbitmq_service_joinmaster:
  rabbitmq_cluster.join:
    {%- for master,value in salt['mine.get']('G@rabbitmq-cluster-id:' + grains['rabbitmq-cluster-id'] + ' and G@role:' + grains['role'] + ' and G@rabbitmq-is-master:True','grains.items','compound').items() %}
    - host: {{ master }}
    {% endfor %}

{%- endif -%}

