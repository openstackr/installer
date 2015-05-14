{% from "ntp/files/map.jinja" import ntp with context %}
{% from "ntp/files/map.jinja" import ntpdate with context %}

ntp-package:
  pkg.installed:
    - name: {{ ntp.name }}

ntpd-package:
  pkg.installed:
    - name: {{ ntpdate.name }}
