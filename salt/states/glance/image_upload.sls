{% from "glance/files/map.jinja" import glance with context %}
{% from "keystone/files/map.jinja" import keystone  with context %}


glance_sourcerc:
  environ.setenv:
    - name: glance_env_images
    - value:
        OS_TENANT_NAME: service
        OS_USERNAME: {{ glance.name }}
        OS_PASSWORD: {{ glance.password }}
        OS_AUTH_URL: http://{{ salt['publish.publish']('function:controller','grains.get','ipv4','grain').values()[0][1] }}:35357/v2.0
        OS_SERVICE_TOKEN: {{ keystone.conn_token }}
        OS_SERVICE_ENDPOINT: http://{{ salt['publish.publish']('function:controller','grains.get','ipv4','grain').values()[0][1] }}:35357/v2.0
    - update_minion: True


#download your images to /root/images in controller node. 

glance_upload:
  cmd:
  - run
  - name: glance image-create --name "cirros-0.3.3-x86_64-disk.img" --file /root/cirros-0.3.3-x86_64-disk.img --disk-format qcow2 --container-format bare --is-public True --progress
