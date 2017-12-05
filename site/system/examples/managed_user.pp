# Linux requires a hash for the password. This one is 'Puppet8Labs!'
# Generate your own with the command `openssl passwd -1` if you'd like.
$password = '$1$RusAfONw$pcUVXo39wvJUZptP3BJ9Y.'

system::managed_user { ['aaron', 'kaitlin', 'alison']:
  password => $password,
}
