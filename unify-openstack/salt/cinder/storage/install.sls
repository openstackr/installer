include:
  - repo.install

storage_install:
  pkg.installed:
    - pkgs:
      - openstack-cinder 
      - MySQL-python
      - python-oslo-db
      - targetcli
    - pkg_verfy: True
    - require:
      - pkg: juno_release

