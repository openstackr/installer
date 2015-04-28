# Formula for adding juno repo for  centos
.. note::
    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

#Available states
#state order:
* yum-plugin
* install
* configure

# yum-plugin:
This formula will install yum-plugin-priorities package

#What is the use of yum-plugin-priorities ?
The priorities plugin can be used to enforce ordered protection of repositories, by associating priorities to repositories. Packages from repositories with a lower priority will never be used to upgrade packages that were installed from a repository with a higher priority. The priorities are also in effect when a new package is installed - if a package is in more than one repository, it will be installed from the repository with the highest priority. This plugin is particularly useful for anyone who uses one or more third-party repositories, as these repositories may update system files, which can potentially compromise the stability of your CentOS installation

#install
 This formula will install the juno repo configuration in /etc/yum.repos.d/rdo-release.repo 
 
# configure
This formula will configure the below things in /etc/yum.repos.d/rdo-release.repo 

* enabling the gpg key file
* enabling the gpg check
* enabling the repo.



 