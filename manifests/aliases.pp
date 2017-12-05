class system::aliases (
	String $admin = 'root',
)	{
	file { '/et/aliases':
    	ensure => file,
        owner => 'root',
        group => 'root',
        mode => '0644',
        content => epp('system/aliases.epp', {admin => $admin }),
	}
    exec { '/usr/bin/newaliases':
    	refreshonly => true,
        subscribe => File['/etc/aliases'],
   	}
}