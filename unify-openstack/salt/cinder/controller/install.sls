include:
  - cinder.controller.database
  - cinder.controller.cinder_user
  - repo.install


cinder_packages:
  pkg.installed:
    - pkgs:
      - openstack-cinder 
      - python-cinderclient
      - python-oslo-db
    - pkg_verfy: True
    - update: True
    - require:
      - pkg: juno_release

