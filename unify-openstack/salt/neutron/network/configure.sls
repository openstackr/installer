
neutron_conf:
  file:
    - managed
    - name: /etc/neutron/neutron.conf 
    - source: salt://neutron/network/files/neutron.conf
    - template: jinja
    - user: neutron
    - group: neutron



ml2_conf:
  file:
    - managed
    - name: /etc/neutron/plugins/ml2/ml2_conf.ini 
    - source: salt://neutron/network/files/ml2_conf.ini
    - template: jinja
    - user: neutron
    - group: neutron


l3_conf:
  file:
    - managed
    - name: /etc/neutron/l3_agent.ini 
    - source: salt://neutron/network/files/l3_agent.ini
    - template: jinja
    - user: neutron
    - group: neutron


dhcp_conf:
  file:
    - managed
    - name: /etc/neutron/dhcp_agent.ini 
    - source: salt://neutron/network/files/dhcp_agent.ini
    - template: jinja
    - user: neutron
    - group: neutron


metadata_conf:
  file:
    - managed
    - name: /etc/neutron/metadata_agent.ini 
    - source: salt://neutron/network/files/metadata_agent.ini
    - template: jinja
    - user: neutron
    - group: neutron




