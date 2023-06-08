// To parse this JSON data, do
//
//     final companyResponse = companyResponseFromMap(jsonString);

import 'dart:convert';

class Company {
    Company({
        required this.id,
        required this.companyName,
        required this.description,
        required this.websiteUrl,
        required this.profilePicture,
        required this.bannerPicture,
        required this.email,
        required this.passwordHash,
        required this.passwordSalt,
        required this.roleId,
    });

    int id;
    String companyName;
    String description;
    String websiteUrl;
    String profilePicture;
    String bannerPicture;
    String email;
    String passwordHash;
    String passwordSalt;
    int roleId;

    factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Company.fromMap(Map<String, dynamic> json) => Company(
        id: json["id"],
        companyName: json["companyName"],
        description: json["description"],
        websiteUrl: json["websiteUrl"],
        profilePicture: json["profilePicture"],
        bannerPicture: json["bannerPicture"],
        email: json["email"],
        passwordHash: json["passwordHash"],
        passwordSalt: json["passwordSalt"],
        roleId: json["roleId"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "companyName": companyName,
        "description": description,
        "websiteUrl": websiteUrl,
        "profilePicture": profilePicture,
        "bannerPicture": bannerPicture,
        "email": email,
        "passwordHash": passwordHash,
        "passwordSalt": passwordSalt,
        "roleId": roleId,
    };
}
