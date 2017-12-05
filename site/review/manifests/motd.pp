# Lab 3.2
class review::motd {

  file { '/etc/motd':
    ensure   => file, 
    template => epp('review/motd.epp', $fqdn),
  }

}
