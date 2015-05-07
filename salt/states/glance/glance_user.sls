{% from "glance/files/map.jinja" import glance with context %}
{% from "keystone/files/map.jinja" import keystone with context %}

glance_user:
  keystone.user_present:
    - name: {{ glance.name }}
    - password: {{ glance.password }}
    - email: {{ glance.email }}
    - roles:
        admin:
          - admin
          - member
        service:
          - admin
          - member
    - connection_token: {{ keystone.conn_token }}

glance_service:
  keystone.service_present:
    - name: {{ glance.name }}
    - service_type: image
    - description: Openstack Image Service
    - connection_token: {{ keystone.conn_token }}

glance_endpoint:
  keystone.endpoint_present:
    - name: {{ glance.name }}
    - publicurl: http://{{ salt['publish.publish']('function:controller','grains.get','ipv4','grain').values()[0][1] }}:9292
    - internalurl: http://{{ salt['publish.publish']('function:controller','grains.get','ipv4','grain').values()[0][1] }}:9292
    - adminurl: http://{{ salt['publish.publish']('function:controller','grains.get','ipv4','grain').values()[0][1] }}:9292
    - region: regionone
    - profile: openstack1
    - connection_token: {{ keystone.conn_token }}

