nova_controller_setup:
  salt.state:
    - tgt: 'id:controller'
    - tgt_type: grain
    - sls:
        - nova.controller.install
        - nova.controller.configure
        - nova.controller.start
