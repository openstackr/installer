mysql:
  salt.state:
    - tgt: 'role:mysql'
    - tgt_type: grain 
    - sls:
        - mysql_server.install
        - mysql_server.configure
        - mysql_server.start
        - mysql_server.db_setup
