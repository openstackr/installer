include:
  - .install



nova_conf:
  file.managed:
    - name: "/etc/nova/nova.conf"
    - source: salt://nova/compute/files/nova.conf
    - template: jinja
    - require:
      -  pkg: nova_compute





