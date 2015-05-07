include:
  - repo.install

openstack-controller:
  pkg.installed:
    - update: True
    - pkgs:
      - openstack-nova-api
      - openstack-nova-cert
      - openstack-nova-conductor
      - openstack-nova-console
      - openstack-nova-novncproxy
      - openstack-nova-scheduler
      - python-novaclient
    - require:
      - pkg: juno_release
