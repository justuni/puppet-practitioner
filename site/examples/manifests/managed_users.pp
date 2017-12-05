class examples::managed_users($password) {
  system::managed_user { ['aaron', 'kaitlin', 'jose']:
    password => $password,
  }
}
