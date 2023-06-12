class ValidatePassword {
  bool isPasswordLengthValid(String password, String confirmPassword,
      {int quantityLength = 5}) {
    return password.length >= quantityLength;
  }

  bool isPasswordEquals(String password, String confirmPassword) {
    return password == confirmPassword;
  }
}
