user { 'admin':
  ensure => present,
}

class { 'system::aliases':
  admin   => 'training',
  require => User['admin'],
}

