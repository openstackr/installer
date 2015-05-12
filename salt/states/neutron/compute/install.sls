include:
  - repo.install


neutron_compute_install:
  pkg.installed:
    - pkgs:
      - openstack-neutron-ml2
      - openstack-neutron-openvswitch
    - require:
      - pkg: juno_release   

