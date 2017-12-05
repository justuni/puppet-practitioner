class review::motd {

  file { "/etc/motd":
    ensure => file,
    mode   => '0444',
    content => epp('review/motd.epp'),
  }

}