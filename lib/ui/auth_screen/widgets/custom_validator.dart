class CustomValidator {
  static String? valPassword(String? val, bool signIn) {
    if (val!.isEmpty) {
      signIn = false;
      return 'Please fill in this field';
    } else if (!RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~`)%\-(_+=;:,.<>/?"[{\]}|^]).{8,}$')
        .hasMatch(val)) {
      signIn = false;
      return 'Please enter a valid password';
    }
    return null;
  }
  static String? valLogin(String? val, bool signIn) {
    if (val!.isEmpty) {
      return 'Please fill in this field';
    } else if (!RegExp(
        r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$')
        .hasMatch(val)) {
      return 'Please enter a valid email';
    }
    return null;
  }
}