include:
  - .install

{% from "nova/compute/files/map.jinja" import nova_compute_service with context %}

{% for key, value in nova_compute_service.iteritems() %}

{{ value }}:
  service.running:
     - enable: True
     - reload: True
     - require: 
       - pkg: nova_compute

{% endfor %}

