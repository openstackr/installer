nova_compute_setup:
  salt.state:
    - tgt: 'function:compute'
    - tgt_type: grain
    - sls:
        - nova.compute.install
        - nova.compute.configure
        - nova.compute.start
