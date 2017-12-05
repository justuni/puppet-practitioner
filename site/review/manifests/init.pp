class review (
  $user = 'review',
) {
  include review::motd

  # this class should accept a parameter rather than having
  # the username hardcoded.

  # Uncomment and use this variable where appropriate
  $homedir = $user ? {
   'root'  => '/root',
   default => "/home/{$user}",
  }

  user { $user:
    ensure     => present,
    shell      => '/bin/bash',
    managehome => true,
  }

  file { "${homedir}/.bashrc":
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => '0644',
    source => 'puppet:///modules/review/bashrc'
  }

  service { 'puppet':
    ensure => stopped,
    enable => false,
  }

}
