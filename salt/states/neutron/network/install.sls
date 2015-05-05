include:
  - repo.install


neutron_network_install:
  pkg.installed:
    - pkgs:
      - openstack-neutron
      - openstack-neutron-ml2
      - openstack-neutron-openvswitch
    - require:
      - pkg: juno_release   

