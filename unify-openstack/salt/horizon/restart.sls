## Apache service for horizon dashboard display ##

httpd_service_reload:
  service.running:
    - reload: True
    - name: httpd

## memcached: high-performance memory object caching system ##

memcached_service_reload:
  service.running:
    - reload: True
    - name: memcached
