{% from "nova/compute/files/map.jinja" import nova_compute_service with context %}

{% for key, value in nova_compute_service.iteritems() %}
{{ value }}:
    service:
      - dead 
{% endfor %}      



