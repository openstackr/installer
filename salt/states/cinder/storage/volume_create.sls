{%- from "cinder/controller/files/map.jinja" import cinder_controller with context -%}
{% from "keystone/files/map.jinja" import keystone  with context %}


/dev/sdb:
  lvm.pv_present

cinder-volumes:
  lvm.vg_present:
    - devices: /dev/sdb


make_cinder_volume:
  environ.setenv:
    - name: cinder_env_volume
    - value:
        OS_TENANT_NAME: service
        OS_USERNAME: {{ cinder_controller.name }}
        OS_PASSWORD: {{ cinder_controller.password }}
        OS_AUTH_URL: http://{{ salt['publish.publish']('function:controller','grains.get','ipv4','grain').values()[0][1] }}:35357/v2.0
        OS_SERVICE_TOKEN: {{ keystone.conn_token }}
        OS_SERVICE_ENDPOINT: http://{{ salt['publish.publish']('function:controller','grains.get','ipv4','grain').values()[0][1] }}:35357/v2.0
    - update_minion: True


make-volumes:
  cmd:
  - run
  - name: cinder create --volume_type cinder-volumes --display_name test_volume 1
