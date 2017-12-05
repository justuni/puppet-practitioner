class review::motd {

  file { '/etc/motd':
    ensure  => file,
    content => epp('motd.epp'),
  }

}