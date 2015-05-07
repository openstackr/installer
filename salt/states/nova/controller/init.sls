nova_controller_setup:
  salt.state:
    - tgt: 'function:controller'
    - tgt_type: grain
    - sls:
        - nova.controller.install
        - nova.controller.configure
        - nova.controller.start
