include:
  - repo.install

nova_compute:
  pkg.installed:
    - update: True
    - pkgs:
      - openstack-nova-compute
      - sysfsutils
    - require:
      - pkg: juno_release

    
    

