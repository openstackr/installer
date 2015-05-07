glance_setup:
  salt.state:
    - tgt: 'function:controller'
    - tgt_type: grain
    - sls:
        - glance.install
        - glance.configure
        - glance.glance_user
        - glance.start 
        - glance.image_upload
