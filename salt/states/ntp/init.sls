ntp_setup:
  salt.state:
    - tgt: 'id:*'
    - tgt_type: grain
    - sls:
        - ntp.install
        - ntp.configure
        - ntp.start
