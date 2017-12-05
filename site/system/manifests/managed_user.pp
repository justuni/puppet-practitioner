define system::managed_user (
  $password = undef,
  $home     = undef,
) {
  if $home {
    $homedir = $home
  }
  else {
    $homedir = "/home/${name}"
  }

  File {
    owner => $name,
    group => 'wheel',
    mode  => '0644',
  }

  # manage a user called $name and that user's `.bashrc` if they're on Linux
  # This can likely reuse some of the code you wrote for the `review` class.
  # Make sure you update variables or paths as required.

  user { $name:
    ensure     => present,
    password   => $password,
    shell      => '/bin/bash',
    managehome => true,
  }

  if $kernel == 'Linux' {
    file { "$homedir/.bashrc":
      ensure => file
      group  => $name,
      source => 'puppet:///modules/system/bashrc',
    }
  }

  notify { "Created a new managed user named '$name'!": }

}
