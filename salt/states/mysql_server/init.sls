mysql:
  salt.state:
    - tgt: 'role:mysql'
    - tgt_type: grain 
    - sls:
        - mysql_server.install

mysql_slave:
  salt.state:
    - tgt: 'mysql-is-master:False'
    - tgt_type: grain
    - sls:
        - mysql_server.configure
        - mysql_server.start
    - require:
      - salt: mysql_master

mysql_master:
  salt.state:
    - tgt: 'mysql-is-master:True'
    - tgt_type: grain
    - sls:
        - mysql_server.configure
        - mysql_server.start
