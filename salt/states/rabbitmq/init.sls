rabbitmq:
  salt.state:
    - tgt: 'role:rabbitmq'
    - tgt_type: grain
    - sls:
        - rabbitmq.install
        - rabbitmq.start


rabbitmq_slave:
  salt.state:
    - tgt: 'rabbitmq-is-master:False'
    - tgt_type: grain
    - sls:
        - rabbitmq.configure
    - require:
      - salt: rabbitmq
