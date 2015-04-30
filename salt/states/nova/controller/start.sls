{% from "nova/controller/files/map.jinja" import nova_controller_service with context %}

include:
  - .install


{% for key, value in nova_controller_service.iteritems() %}

{{ value }}:
  service.running:
     - enable: True
     - reload: True
     - require:
       - pkg: openstack-controller

{% endfor %}
