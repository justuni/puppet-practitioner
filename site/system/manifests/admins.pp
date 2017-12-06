class system::admins {
  $users = {
    'zack'   => { 'max_queries_per_hour' => 1200 },
    'monica' => { 'max_queries_per_hour' => 600 },
    'brad'   => { 'max_queries_per_hour' => 600 },
    'luke'   => { 'max_queries_per_hour' => 600 },
  }

  $retired_users = [
    'ralph',
  ]
  
  require mysql::server
  $users.each |String $username, Hash $params| {
    mysql_user { "${username}@localhost":
      ensure               => present,
      max_queries_per_hour => $params['max_queries_per_hour'],
    }

    user { $username:
      ensure => present,
    }
  }

  $retired_users.each |String $username| {
    mysql_user { "${username}@localhost":
      ensure => absent,
    }

    user { $username:
      ensure => absent,
    }

  }

}
