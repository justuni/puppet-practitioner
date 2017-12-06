class system::admins {

  $users = {
    'zack'   => { 'max_queries_per_hour' => 1200 },
    'monica',
    'brad',
    'luke',
  }

  $retired_users = [
    'ralph',
  ]
  
  require mysql::server
  $users.each |String $username, Hash $params| {
    $default_max_queries_per_hour => 600

    mysql_user { "${username}@localhost":
      ensure               => present,
      max_queries_per_hour => pick($params['max_queries_per_hour'], $default_max_queries_per_hour),
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
