rabbitmq:
  salt.state:
    - tgt: 'role:rabbitmq'
    - tgt_type: grain
    - sls:
        - rabbitmq.install
        - rabbitmq.start


rabbitmq_slave:
  salt.state:
    - tgt: 'G@rabbitmq-is-master:False and G@role:rabbitmq'
    - tgt_type: compound
    - sls:
        - rabbitmq.configure
    - require:
      - salt: rabbitmq
