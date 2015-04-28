neutron_network:
  salt.state:
    - tgt: 'function:network'
    - tgt_type: grain 
    - sls:
        - neutron.network.install
        - neutron.network.configure
