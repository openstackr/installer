# usage:
# salt * state.sls common.grains pillar='{"current-openstack-instance": "devcloud"}'
#
# 'current-openstack-instance' value should be passed and
# needs to match a value of openstack-instance in minion pillar.
#
# set openstack_id
{% set openstack_id = 'openstack-instance:' + pillar['current-openstack-instance'] + ':openstack-id' %}

# set minion_matcher (to the complex string which can't be passed pillar.get as it is)
{% set minion_matcher = 'openstack-instance:' + pillar['current-openstack-instance'] + ':minions:' + grains['id'] %}

{{ minion_matcher }}:
  test.succeed_without_changes:
    - name: here to see if ID above is correct

openstack-id:
  grains.present:
    - value: {{ salt['pillar.get'](openstack_id, 'default_cloud') }}

{% for grain_name, grain_value in salt['pillar.get'](minion_matcher, {}).items() %}

{{ grain_name }}:
  grains.present:
    - value: {{ grain_value }}

{% endfor %}

