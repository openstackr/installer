{% from "neutron/controller/files/map.jinja" import neutron_controller,controller_ip with context %}
{% from "keystone/files/map.jinja" import keystone  with context %}

Keystone_tenants:
  keystone.tenant_present:
    - names:
      - admin
      - demo
      - service  
    - connection_token: {{ keystone.conn_token }}


Keystone_roles:
  keystone.role_present:
    - names:
      - admin
      - member
    - connection_token: {{ keystone.conn_token }} 


Keystone_users:
  keystone.user_present:
    - name: {{ neutron_controller.name }}
    - password: {{ neutron_controller.password }}
    - email: neutron@openstack.com 
    - roles:
        service:
          - admin
    - connection_token: {{ keystone.conn_token }} 


neutron_service:
  keystone.service_present:
    - name: neutron 
    - service_type: network 
    - description: OpenStack Networking
    - connection_token: {{ keystone.conn_token }} 


neutron_endpoint:
  keystone.endpoint_present:
    - name: neutron 
    - internalurl: http://{{ controller_ip[0]|join(' ') }}:9696
    - publicurl: http://{{ controller_ip[0]|join(' ') }}:9696
    - adminurl: http://{{ controller_ip[0]|join(' ') }}:9696 
    - region: regionone
    - connection_token: {{ keystone.conn_token }}

