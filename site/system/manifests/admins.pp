class system::admins {
  require mysql::server

  $mysql_users = ['zack@localhost', 'monica@localhost', 'brad@localhost', 'luke@localhost']

  $mysql_users.each |String $mysql_user| {
    mysql_user { "${mysql_user}":
      ensure => present,
      max_queries_per_hour => 600,
    }
  }

  mysql_user { 'zack@localhost':
    max_queries_per_hour => 1200,
  }
  mysql_user { 'ralph@localhost':
    ensure => absent,
  }

  user { ['zack', 'monica', 'ralph', 'brad', 'luke']:
    ensure => present,
  }
}
