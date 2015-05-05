include:
  - rabbitmq.repo

rabbitmq_install:
  pkg.installed:
    - name: rabbitmq-server
    - require:
      - sls: rabbitmq.repo
