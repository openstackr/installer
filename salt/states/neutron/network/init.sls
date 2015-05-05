neutron_network:
  salt.state:
    - tgt: 'function:network'
    - tgt_type: grain 
    - sls:
        - neutron.network.pre-request
        - neutron.network.install
        - neutron.network.configure
        - neutron.network.start
