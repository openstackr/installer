{% from "repo/map.jinja" import pkg with context %}

juno_release:
  pkg.installed:
    - sources:
      - rdo-release: {{ salt['pillar.get']('junorepo', pkg.rpm) }}

  
