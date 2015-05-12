{% if 'role' in grains and grains['role'] == 'mysql' %}

include:
  - mysql_server.repo

mysql_install:
  pkg.installed:
    - pkgs:
      - MariaDB-Galera-server
      - galera
      - rsync
{% endif %}
