MySQL
==============

Install and configure Mysql Server 

Pre-Request
==============

``Role Setup``
---------------
Used for Setting Following  Custom grain items

Role  (Input value :string) :            mysql
mysql-is-master  (Input value :boolean): True
cluster-id  (Input value :string):       mysql-cluster1
openstack-id  (Input value :string):     openstack-dev


States Executed During Salt-Orchestration
=========================================

     Install
     Configure
     Start

``install.sls``
----------

Install the required services for configuring MySQL.

`Packages to be installated` 

    --> MariaDB-Galera-server
    --> galera
    --> rsync 

``configure.sls``
-------------
    --> Check the cluster servers using cluster-id
    --> Configure the cluster.cnf and perform validation
    --> Move the file to the respective servers 

``start.sls``
-------------------
    --> Start Mysql service with required commands according to the roles set
	
    
Post-Request
==============

``db_setup.sls``
--------------
    --> salt '*' state.sls mysql_server.db_setup
    --> Changes Root password
    --> Creates new user with host % to enable access from multiple hosts

