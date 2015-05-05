sysctl_conf:
  file:
    - managed
    - name: /etc/sysctl.conf
    - source: salt://neutron/network/files/sysctl.conf
    - template: jinja


neutron_setup_sysctl:
  cmd:
    - run
    - name: sysctl -p

