{% set neutron_network_service =  salt['grains.filter_by']({
    'RedHat': {
       'neutron-openvswitch-agent': 'neutron-openvswitch-agent',
       'neutron-l3-agent': 'neutron-l3-agent',
       'neutron-dhcp-agent': 'neutron-dhcp-agent',
       'neutron-metadata-agent': 'neutron-metadata-agent',
    },
    'Debian': {
       'neutron-openvswitch-agent': 'neutron-openvswitch-agent',
       'neutron-l3-agent': 'neutron-l3-agent',
       'neutron-dhcp-agent': 'neutron-dhcp-agent',
       'neutron-metadata-agent': 'neutron-metadata-agent',

    },
}, ) %}

{% for key, value in neutron_network_service.iteritems() %}

{{ value }}:
  service.running:
     - enable: True
     - reload: True

{% endfor %}


