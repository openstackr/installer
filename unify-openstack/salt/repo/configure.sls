set_pubkey_juno:
  file.replace:
    - append_if_not_found: True
    - name: /etc/yum.repos.d/rdo-release.repo
    - pattern: '^gpgkey=.*'
    - repl: 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-RDO-Juno'
    - requires:
      - pkg: rdo-release


set_gpg_juno:
  file.replace:
    - append_if_not_found: True
    - name: /etc/yum.repos.d/rdo-release.repo
    - pattern: 'gpgcheck=.*'
    - repl: 'gpgcheck=1'
    - requires:
      - pkg: rdo-release

enable_juno:
  file.replace:
    - name: /etc/yum.repos.d/rdo-release.repo
    - pattern: '^enabled=[0,1]'
    - repl: 'enabled=1'
