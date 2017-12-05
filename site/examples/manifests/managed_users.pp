# example declarations for the defined type exercise 

$password = '$1$KvlzY/4u$19Oe.k1wNeKhh..uKj6wV1'

class examples::managed_users($password) {
  system::managed_user { ['aaron', 'kaitlin', 'jose']:
    password => $password,
  }
}
