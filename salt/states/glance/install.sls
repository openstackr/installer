include:
  - repo.install

glance_packages:
  pkg.installed:
    - update: True
    - pkgs:
      - openstack-glance
      - python-glanceclient
    - require:
      - pkg: juno_release
