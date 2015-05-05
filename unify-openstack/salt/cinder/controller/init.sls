cinder_controller_setup:
  salt.state:
    - tgt: 'function:controller'
    - tgt_type: grain
    - sls:
        - cinder.controller.install
        - cinder.controller.configure
        - cinder.controller.start
