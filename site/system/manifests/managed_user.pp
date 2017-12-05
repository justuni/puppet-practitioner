define system::managed_user (
  $password => '$1$HdDw//gC$2VBiQ1x5blLPwNS.G.Iw21',
) {
$homedir = $title ? {
  'root' => '/root',
  default => "/home/${title}",
}
# Puppet will evaluate these resources in the proper order because it's smart
# and knows about dependencies between files and their owners
user { $title:
  ensure => present,
  password => $password,
  managehome => true,
}

if $kernel == 'Linux' {
  file { "${homedir}/.bashrc":
    ensure => file,
    owner  => $title,
    group  => $title,
    mode   => '0644',
    source => 'puppet:///modules/system/bashrc'
    }
  }
}