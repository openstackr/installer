## Apache service for horizon dashboard display ##

httpd_service:
  service.running:
    - enable: True
    - reload: True
    - name: httpd

## memcached: high-performance memory object caching system ##

memcached_service:
  service.running:
    - enable: True
    - reload: True
    - name: memcached
