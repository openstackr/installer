nova_compute_setup:
  salt.state:
    - tgt: 'id:compute'
    - tgt_type: grain
    - sls:
        - nova.compute.install
        - nova.compute.configure

