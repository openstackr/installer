
neutron_conf:
  file:
    - managed
    - name: /etc/neutron/neutron.conf 
    - source: salt://neutron/compute/files/neutron.conf
    - template: jinja
    - user: neutron
    - group: neutron


ml2_conf:
  file:
    - managed
    - name: /etc/neutron/plugins/ml2/ml2_conf.ini 
    - source: salt://neutron/compute/files/ml2_conf.ini
    - template: jinja
    - user: neutron
    - group: neutron

neutron_plugin:
  cmd:
    - run
    - name: ln -s /etc/neutron/plugins/ml2/ml2_conf.ini /etc/neutron/plugin.ini


env_scripts:
   file:
    - managed
    - name: /root/neutron-source.sh
    - source: salt://neutron/controller/files/source.sh
    - template: jinja

openvswitch_server_state:
  cmd:
    - run
    - name: service  openvswitch restart


openvswitch_enable:
  service.running:
    - name: openvswitch
    - enable: True


neutron_setup:
  cmd:
    - run
    - names:
      - cp /usr/lib/systemd/system/neutron-openvswitch-agent.service /usr/lib/systemd/system/neutron-openvswitch-agent.service.orig
      - sed -i 's,plugins/openvswitch/ovs_neutron_plugin.ini,plugin.ini,g' /usr/lib/systemd/system/neutron-openvswitch-agent.service
