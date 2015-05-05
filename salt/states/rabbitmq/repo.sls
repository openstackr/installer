epel:
  pkgrepo.managed:
    - humanname: Extra Packages for Enterprise Linux 7 - $basearch
    - mirrorlist: https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=$basearch
    - gpgkey: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
    - gpgcheck: 1


epel-debuginfo:
  pkgrepo.managed:
    - humanname: Extra Packages for Enterprise Linux 7 - $basearch - Debug 
    - mirrorlist: https://mirrors.fedoraproject.org/metalink?repo=epel-debug-7&arch=$basearch 
    - gpgkey: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 
    - gpgcheck: 1


epel-source:
  pkgrepo.managed:
    - humanname: Extra Packages for Enterprise Linux 7 - $basearch - Source
    - mirrorlist: https://mirrors.fedoraproject.org/metalink?repo=epel-source-7&arch=$basearch
    - gpgkey: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
    - gpgcheck: 1


