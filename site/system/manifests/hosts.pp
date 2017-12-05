class system::hosts {
  resources {'host':
    purge => true,
  }
  host { 'ip6-allnodes':
    ensure => 'present',
    ip     => 'ff02::1',
    target => '/etc/hosts',
  }
  host { 'ip6-allrouters':
    ensure => 'present',
    ip     => 'ff02::2',
    target => '/etc/hosts',
  }
  host { 'ip6-localnet':
    ensure => 'present',
    ip     => 'fe00::0',
    target => '/etc/hosts',
  }
  host { 'ip6-mcastprefix':
    ensure => 'present',
    ip     => 'ff00::0',
    target => '/etc/hosts',
  }
  host { 'localhost':
    ensure => 'present',
    ip     => '127.0.0.1',
    target => '/etc/hosts',
  }
  host { 'master.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['puppet'],
    ip           => '172.17.0.1',
    target       => '/etc/hosts',
  }
  host { 'pbrandiezs.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['pbrandiezs'],
    ip           => '172.17.0.13',
    target       => '/etc/hosts',
  }
}
