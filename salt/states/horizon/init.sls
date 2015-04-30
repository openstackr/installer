horizone_setup:
  salt.state:
    - tgt: 'id:controller'
    - tgt_type: grain
    - sls:
        - horizon.install
        - horizon.configure
        - horizon.start
