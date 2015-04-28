neutron_compute_service_start:
  service:
    - running
    - name: neutron-openvswitch-agent
    - enable: True
    - restart: True
