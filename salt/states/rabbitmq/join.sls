{% if 'rabbitmq-is-master' in grains and salt['grains.get']('rabbitmq-is-master') == False %}

rabbit_join:
  rabbitmq_cluster.join:
    {%- for master,value in salt['mine.get']('G@rabbitmq-cluster-id:' + grains['rabbitmq-cluster-id'] + ' and G@role:' + grains['role'] + ' and G@rabbitmq-is-master:True','grains.items','compound').items() %}
    - host: {{ master }} 
    {% endfor %}
{%- endif -%}
