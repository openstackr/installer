include:
  - .install



libvirtd_group:
  group.present:
      - name: libvirtd
      - system: True



nova_conf:
  file.managed:
    - name: "/etc/nova/nova.conf"
    - source: salt://nova/compute/files/nova.conf
    - template: jinja
    - require:
      -  pkg: nova_compute



libvirtd_conf:
  file.managed:
    - name: "/etc/libvirt/libvirtd.conf"
    - source: salt://nova/compute/files/libvirtd.conf
    - template: jinja

libvirt_conf:
  file.managed:
    - name: "/etc/libvirt/libvirt.conf"
    - source: salt://nova/compute/files/libvirt.conf
    - template: jinja
