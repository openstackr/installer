neutron_conf:
  file:
    - managed
    - name: /etc/neutron/neutron.conf 
    - source: salt://neutron/controller/files/neutron.conf
    - template: jinja
    - user: neutron
    - group: neutron

ml2_conf:
  file:
    - managed
    - name: /etc/neutron/plugins/ml2/ml2_conf.ini 
    - source: salt://neutron/controller/files/ml2_conf.ini
    - template: jinja
    - user: neutron
    - group: neutron

/var/log/neutron:
  file.directory:
     - user: neutron
     - group: neutron
     - recurse:
       - user
       - group

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

neutron_setup:
  cmd:
    - run
    - name: neutron-db-manage --config-file /etc/neutron/neutron.conf --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade juno
