include:
  - repo.install

mysql_python_pkg:
  pkg.installed:
    - name: MySQL-python
neutron_controller_install:
  pkg.installed:
    - pkgs:
      - openstack-keystone
      - python-keystoneclient
      - openstack-neutron
      - openstack-neutron-ml2
      - python-neutronclient 
      - which
    - require:
      - pkg: juno_release
