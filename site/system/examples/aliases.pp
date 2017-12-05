class system::aliases (
  String $admin = 'root',
) {
    file { '/etc/aliases':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => epp('system/aliases.pp', { admin => $admin}),
    }
    
    exec {
      refreshonly  => true,
      subscribe    => File['/etc/aliases'],
    }
}

