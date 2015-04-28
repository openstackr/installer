include:
  - repo.install

openstack-keystone:
  pkg.installed:
    - update: True
    - name: openstack-keystone
    - require:
      - pkg: juno_release

openstack-keystoneclient:
  pkg.installed:
    - name: python-keystoneclient
