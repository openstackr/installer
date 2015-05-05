{% from "keystone/files/map.jinja" import keystone  with context %}
{% from "cinder/controller/files/map.jinja" import cinder_controller,controller_ip  with context %}


cinder_user:
  keystone.user_present:
    - name: {{ cinder_controller.name }} 
    - password: {{ cinder_controller.password }} 
    - email: admin@test.com
    - roles:
        admin:
          - admin
          - member
        service:
          - admin
          - member
    - connection_token: {{ keystone.conn_token }}

cinder_service:
  keystone.service_present:
    - name: cinder
    - service_type: volume
    - description: OpenStack Block Storage
    - connection_token: {{ keystone.conn_token }} 

cinder_endpoint:
  keystone.endpoint_present:
    - name: cinder
    - internalurl: http://{{ controller_ip[0]|join(' ') }}:8776/v1/%(tenant_id)s
    - publicurl: http://{{ controller_ip[0]|join(' ') }}:8776/v1/%(tenant_id)s
    - adminurl: http://{{ controller_ip[0]|join(' ') }}:8776/v1/%(tenant_id)s
    - region: regionone
    - connection_token: {{ keystone.conn_token }} 
