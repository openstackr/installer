haproxy:
  salt.state:
    - tgt: 'haproxy:*'
    - tgt_type: grain 
    - sls:
        - haproxy.haproxy
