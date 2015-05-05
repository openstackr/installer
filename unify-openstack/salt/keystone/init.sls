keystone_setup:
  salt.state:
    - tgt: 'id:controller'
    - tgt_type: grain
    - sls:
        - repo
        - keystone.install
        - keystone.configure
        - keystone.start
        - keystone.keystone_user
