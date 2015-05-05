## Installing the required packages to configure horizon ##
include:
  - repo.install

horizonpkg:
  pkg.installed:
    - pkgs:
      - httpd
      - memcached 
      - python-memcached
      - mod_wsgi
      - openstack-dashboard
    - update: True
    - require:
      - pkg: juno_release

