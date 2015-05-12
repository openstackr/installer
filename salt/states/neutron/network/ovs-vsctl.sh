ovs-vsctl add-br br-ex
ovs-vsctl add-port br-ex enp0s3
ifconfig enp0s3 0 && ifconfig br-ex {{ salt['grains.get']('ipv4')[0] }} netmask 255.255.255.0
route add default gw 10.0.2.1 br-ex
