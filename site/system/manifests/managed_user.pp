define system::managed_user (
  $user,
  $password,
  $home = undef,
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

  user { $user:
    ensure     => present,
    shell      => '/bin/bash',
    managehome => true,
    home => $home,
  }

  if $kernel == "Linux" {
    file { "/home/${user}/.bashrc":
      ensure => file,
      owner  => $user,
      group  => $user,
      mode   => '0644',
      source => 'puppet:///modules/review/bashrc'
    }
  }


  # manage a user called $name and that user's `.bashrc` if they're on Linux
  # This can likely reuse some of the code you wrote for the `review` class.
  # Make sure you update variables or paths as required.
}
