neutron_compute:
  salt.state:
    - tgt: 'function:compute'
    - tgt_type: grain 
    - sls:
        - neutron.compute.pre-request
        - neutron.compute.install
        - neutron.compute.configure
        - neutron.compute.start
