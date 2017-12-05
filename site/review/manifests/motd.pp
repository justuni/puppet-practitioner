class review::motd {

  file { "/etc/motd":
    ensure => file,
    mode   => '0r44',
    content => epp('review/motd.epp'),
  }

}