neutron_compute:
  salt.state:
    - tgt: 'function:compute'
    - tgt_type: grain 
    - sls:
        - neutron.compute.install
        - neutron.compute.configure
