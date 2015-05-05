{% from "nova/controller/files/map.jinja" import nova_controller,controller_ip with context %}
{% from "keystone/files/map.jinja" import keystone with context %}

keystone_user:
  keystone.user_present:
    - name: {{ nova_controller.name }}
    - password: {{ nova_controller.password }}
    - email: {{ nova_controller.email }}
    - roles:
        admin:
          - admin 
          - member
        service:
          - admin
          - member
    - connection_token: {{ keystone.conn_token }}

keystone_service:
  keystone.service_present:
    - name: {{ nova_controller.name }}
    - service_type: compute
    - description: Openstack compute
    - connection_token: {{ keystone.conn_token }} 

keystone_endpoint:
  keystone.endpoint_present:
    - name: {{ nova_controller.name }}
    - publicurl: http://{{ controller_ip[0]|join(' ') }}:8774/v2/%(tenant_id)s  
    - internalurl: http://{{ controller_ip[0]|join(' ') }}:8774/v2/%(tenant_id)s 
    - adminurl: http://{{ controller_ip[0]|join(' ') }}:8774/v2/%(tenant_id)s 
    - region: regionone  
    - profile: openstack1
    - connection_token: {{ keystone.conn_token }}

