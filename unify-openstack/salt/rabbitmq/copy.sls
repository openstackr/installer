{% if 'rabbitmq-is-master' in grains and salt['grains.get']('rabbitmq-is-master') == False %}

rabbitmq_confgure:
  file.managed:
    - name: /var/lib/rabbitmq/.erlang.cookie 
    - template: jinja
    {%- for master,value in salt['mine.get']('G@rabbitmq-cluster-id:' + grains['rabbitmq-cluster-id'] + ' and G@role:' + grains['role'] + ' and G@rabbitmq-is-master:true','grains.items','compound').items() %}
    - source: salt://{{ master }}/var/lib/rabbitmq/.erlang.cookie
    {% endfor %}
    - makedirs: True
{%- endif -%}
