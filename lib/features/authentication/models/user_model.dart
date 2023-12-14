import "package:demo_app/utils/formatters.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  String get fullName => '$firstName $lastName';

  String get formattedPhoneNo => Formatters.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullname) => fullname.split(' ');

  static String generateUserName(fullname) {
    List<String> nameParts = fullname.split(' ');

    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';

    String camelCaseUserName = "$firstName$lastName";
    String usernameWithPrefix = "uni_$camelCaseUserName";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
        id: "",
        firstName: "",
        lastName: "",
        username: "",
        phoneNumber: "",
        email: "",
        profilePicture: "",
      );

  Map<String, dynamic> toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Username": username,
      "PhoneNumber": phoneNumber,
      "Email": email,
      "ProfilePicture": profilePicture,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data["FirstName"] ?? "",
        lastName: data["LastName"] ?? "",
        username: data["Username"] ?? "",
        email: data["Email"] ?? "",
        phoneNumber: data["PhoneNumber"] ?? "",
        profilePicture: data["ProfilePicture"] ?? "",
      );
    }
    return empty();
  }
}
