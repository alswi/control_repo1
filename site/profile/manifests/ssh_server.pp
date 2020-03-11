class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'root@master.puppet.vm':
		ensure => present,
		user   => 'root',
		type   => 'ssh-rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDi8JapegLeGX6yklhU1FLElGIYPqfi7VX+Qbd/lU96eLGC6kp6Dl5uhRXq0w1UNW1f88dgDjW3/E+nR8NphKyo9pYSK4B9AEsT/beT6UdL6yVIXbs7oLv89JI81ltKfDZIEa9W1tLcqJMSk6D2/CqxcLat0BOUdrjgnU4eMk4G1K6xynHdZvAjC0JT68Cp0TlM/Wb0r/4dDruX8EsM+lPYfPi2Y6UJS5L96xmEZQMvrCjZUbYiWufqTsg1HO+6exj2QOLdJT+9XIa1cH8BtSY41lCK/O8+tD0ZLqFmpCPRjFtbQpoEk92tjD30+Bulsa+6lw6ABQs1g4YA9IPn+m1p',
	}  
}
