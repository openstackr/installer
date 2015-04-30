##Configuring horizon dashboard settings

local_settings:
  file.managed:
    - name: "/etc/openstack-dashboard/local_settings"
    - source: salt://horizon/files/local_settings
    - template: jinja
    - user: apache
    - group: apache

apache:
  user.present:
    - require:
      - group: apache
  group.present:
      - system: True

openstack_dashboard_permission:
  file.directory:
    - name: /usr/share/openstack-dashboard/static
    - user: apache
    - group: apache
    - recurse:
      - user
      - group
