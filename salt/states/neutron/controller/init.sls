neutron_controller:
  salt.state:
    - tgt: 'function:controller'
    - tgt_type: grain 
    - sls:
        - neutron.controller.database 
        - neutron.controller.install
        - neutron.controller.configure
        - neutron.controller.neutron_user
        - neutron.controller.start
