{% from "keystone/files/map.jinja" import keystone,controller_ip  with context %}

Keystone_tenants:
  keystone.tenant_present:
    - names:
      - admin
      - service
    - connection_token: {{ keystone.conn_token }}

Keystone_roles:
  keystone.role_present:
    - names:
      - admin
      - member
    - connection_token: {{ keystone.conn_token }}

Keystone_user:
  keystone.user_present:
    - name: {{ keystone.name }}
    - password: {{ keystone.password }}
    - email: admin@test.com
    - roles:
        admin:
          - admin 
          - member
        service:
          - admin
          - member
    - require:
      - keystone: Keystone_tenants
      - keystone: Keystone_roles
    - connection_token: {{ keystone.conn_token }}

Keystone_service:
  keystone.service_present:
    - name: keystone
    - service_type: identity
    - description: Openstack identity
    - connection_token: {{ keystone.conn_token }}

Keystone_endpoint:
  keystone.endpoint_present:
    - name: keystone
    - publicurl: http://{{ controller_ip[0]|join(' ') }}:5000/v2.0  
    - internalurl: http://{{ controller_ip[0]|join(' ') }}:5000/v2.0
    - adminurl: http://{{ controller_ip[0]|join(' ') }}:35357/v2.0
    - connection_token: {{ keystone.conn_token }}
