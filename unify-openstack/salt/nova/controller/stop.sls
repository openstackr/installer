{% from "nova/controller/files/map.jinja" import nova_controller_service with context %}

{% for key, value in nova_controller_service.iteritems() %}

{{ value }}:
    service:
      - dead 
{% endfor %}      



