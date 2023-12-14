class Validators {
  static String? validateTextEmpty(text, String field) {
    if (text == null || text.isEmpty) {
      return '$field is required';
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email required";
    }
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regex = RegExp(pattern);

    return !regex.hasMatch(value) ? 'Enter a valid email address' : null;
  }

  static String? validateUserName(String value) {
    if (value.isEmpty) {
      return "Username required";
    }
    const pattern =
        r'^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){3,18}[a-zA-Z0-9]$';
    final regex = RegExp(pattern);

    return !regex.hasMatch(value) ? 'Enter a valid username' : null;
  }

  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return "Phone number required";
    }
    const pattern = r'^(?:[+0]91)?[0-9]{10}$';
    final regex = RegExp(pattern);

    return !regex.hasMatch(value) ? 'Enter a vaild phone number' : null;
  }

  static String? validatePassword(String value) {
    if (value.length < 8) {
      return "Paasword length minimum 8 characters";
    }
    if (!RegExp(r'^(?=.*?[a-z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(value)) {
      return "Password should contain small letter ,number and special characters";
    }
    return null;
  }
}
