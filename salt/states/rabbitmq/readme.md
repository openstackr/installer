RabbitMQ
==============

Install and configure RabbitMQ 

Pre-Request
==============

``Role Setup``
---------------
Used for Setting Following  Custom grain items

Role  (Input value :string) :            rabbitmq
rabbitmq-is-master  (Input value :boolean): True
cluster-id  (Input value :string):       rabbitmq-cluster1
openstack-id  (Input value :string):     openstack-dev

``pre-request.sls``
-------------
    --> salt '*' state.sls rabbitmq.pre-request
    --> If no host names is assigned it will enable grain id as host name
    --> Adds host name to /etc/hosts


States Executed During Salt-Orchestration
=========================================

     Install
     Start
     Configure
	 
``install.sls``
----------

Install the required services for configuring rabbitmq.

`Packages to be installated` 

    --> rabbitmq-server

``start.sls``
-------------
    --> starts rabbitmq-server service
    --> Move .erlang.cookie file to salt-master
    

``configure.sls``
-------------------
    --> Rabbitmq Slave servers stores Rabbitmq Master server .erlang.cookie file
    --> Restart rabbitmq-server service 
    --> Joins with Rabbitmq Master server  and creates a cluster
	
    
Post-Request
==============

``rabbitmq_user.sls``
--------------
    --> salt '*' state.sls rabbitmq.rabbitmq_user
    --> Creates a new rabbitmq user and password in rabbitmq cluster
    

