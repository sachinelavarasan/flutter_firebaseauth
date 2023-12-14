class Formatters {
  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 13) {
      return '(${phoneNumber.substring(0, 4)} ${phoneNumber.substring(
        4,
      )})';
    }
    return phoneNumber;
  }
}
