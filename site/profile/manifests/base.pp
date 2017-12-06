class profile::base {
  notify { "Hello, my name is ${::hostname}": }
  include review
  include system::hosts

  class { 'userprefs':
    shell => 'bash',
    editor => 'vim',
  }
  class { 'examples::managed_users':
    password => '$1$1Z1jKUQX$zcvkZr13EaqMOq2nkeSHz1',
  }
  class { 'system::aliases':
    admin => 'root',
  }
}
