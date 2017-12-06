class system::admins {
  $users = {
    'zack'   => 1200,
    'monica' => 600,
    'ralph'  => 600,
    'brad'   => 600,
    'luke'   => 600,
  }

  $retired_users = [
    'ralph',
  ]
  
  require mysql::server
  $users.each |String $username, Integer $qps| {
    mysql_user { "${username}@localhost":
      ensure               => present,
      max_queries_per_hour => $qps,
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
