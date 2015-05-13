{%- from "neutron/controller/files/map.jinja" import neutron_controller with context -%}
{% from "keystone/files/map.jinja" import keystone  with context %}


export OS_TENANT_NAME=service
export OS_USERNAME={{ neutron_controller.name }}
export OS_PASSWORD={{ neutron_controller.password }}
export OS_AUTH_URL=http://{{ salt['publish.publish']('function:controller','grains.get','ipv4','grain').values()[0][0] }}:35357/v2.0
export OS_SERVICE_TOKEN={{ keystone.conn_token }}
export OS_SERVICE_ENDPOINT=http://{{ salt['publish.publish']('function:controller','grains.get','ipv4','grain').values()[0][0] }}:35357/v2.0
