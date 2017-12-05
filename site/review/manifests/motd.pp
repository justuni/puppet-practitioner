# Lab 3.2
class review::motd {

  file { '/etc/motd':
    ensure  => file, 
    content => epp('review/motd.epp', { 'fqdn' => $fqdn }),
  }

}
