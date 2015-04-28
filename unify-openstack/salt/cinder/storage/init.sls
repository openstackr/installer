cinder_setup:
  salt.state:
    - tgt: 'function:compute'
    - tgt_type: grain
    - sls:
        - cinder.storage.install
        - cinder.storage.configure
        - cinder.storage.start
