define system::managed_user (
 $password,
  
){
  $homedir = $title ? {
    'root'  => '/root',
    default => "/home/${title}",
  }
  user { $title:
    ensure     => present,
    password   => $password,
    managehome => true,
  }

  if $kernal == 'Linux' {
   file { "${homedir}/.bashrc":
     ensure => file,
     owner  => $title,
     group  => $title,
     mode   => '0644'

  }

  
}
