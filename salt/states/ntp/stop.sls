{% from "ntp/files/map.jinja" import ntp with context %}

ntp-stop:
  service:
    - name: {{ ntp.service }}
    - dead
