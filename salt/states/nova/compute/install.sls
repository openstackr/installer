include:
  - repo.install

nova_compute:
  pkg.installed:
    - update: True
    - pkgs:
      - openstack-nova-compute
      - sysfsutils
      - qemu-kvm
      - libvirt
      - libvirt-python
      - device-mapper-libs
      - virt-install
    - require:
      - pkg: juno_release

device-mapper-libs_pkg:
   pkg.latest:
    - name: device-mapper-libs


    

