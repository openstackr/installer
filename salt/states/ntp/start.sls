{% from "ntp/files/map.jinja" import ntp with context %}


ntp-start:
  service:
    - name: {{ ntp.service }}
    - running
    - enable: True
    - reload: True
