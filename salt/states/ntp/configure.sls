{% from "ntp/files/map.jinja" import ntp with context %}

ntp-configure:
  file.managed:
    - name: {{ ntp.conf }}
    - source: salt://ntp/files/ntp.conf
