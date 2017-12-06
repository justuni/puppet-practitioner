class system::admins {
  require mysql::server
  
  #common defaults
  Mysql_user {
  	max_queries_per_hour => 600,
  }
  
#  mysql_user { 'zack@localhost':
#    ensure => present,
#    max_queries_per_hour => 1200,
#  }
#  mysql_user { 'monica@localhost':
#    ensure => present,
#  }
#  mysql_user { 'ralph@localhost':
#    ensure => absent,
#  }
#  mysql_user { 'brad@localhost':
#    ensure => present,
#  }
#  mysql_user { 'luke@localhost':
#    ensure => present,
#  }

  user { ['zack', 'monica', 'ralph', 'brad', 'luke']:
    ensure => present,
  }
 
  $retired = ['ralph']
  
  $admins = { 
  	'brad' => {},
    'monica' => {},
    'luke' => {},
    'zack' => {max_queries_per_hour => 1200},
 {
    
  $retired.each |$user, $parameters| {
      mysql_user { "${user}@localhost":
          ensure => absent,
  }
    
   $admins.each |$user, $parameters| {
      mysql_user { "${user}@localhost":
          ensure 				 => present,
          max_queries_per_hour => $parameters['max_queries_per_hour'],
  } 
  
}
