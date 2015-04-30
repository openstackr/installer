keystone_setup:
  salt.state:
    - tgt: 'function:controller'
    - tgt_type: grain
    - sls:
        - keystone.install
        - keystone.configure
        - keystone.start
        - keystone.keystone_user
        - keystone.start
