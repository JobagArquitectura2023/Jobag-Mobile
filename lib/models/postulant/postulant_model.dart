

import 'dart:convert';

Postulant postulantFromJson(String str) => Postulant.fromJson(json.decode(str));
String postulantToJson(Postulant data) => json.encode(data.toJson());

class Postulant {
    Postulant({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.salary,
        required this.email,
        required this.phoneNumber,
        required this.workingPlaces,
        required this.languages,
        required this.studyCenter,
        required this.skills,
        required this.about,
        required this.profilePicture,
        required this.bannerPicture,
        required this.passwordHash,
        required this.passwordSalt,
        required this.roleId,
    });

    int id;
    String firstName;
    String lastName;
    int salary;
    String email;
    int phoneNumber;
    String workingPlaces;
    String languages;
    String studyCenter;
    String skills;
    String about;
    String profilePicture;
    String bannerPicture;
    String passwordHash;
    String passwordSalt;
    dynamic roleId;

    factory Postulant.fromJson(String str) => Postulant.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Postulant.fromMap(Map<String, dynamic> json) => Postulant(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        salary: json["salary"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        workingPlaces: json["workingPlaces"],
        languages: json["languages"],
        skills: json["skills"],
        studyCenter: json["studyCenter"],
        about: json["about"],
        profilePicture: json["profilePicture"],
        bannerPicture: json["bannerPicture"],
        passwordHash: json["passwordHash"],
        passwordSalt: json["passwordSalt"],
        roleId: json["roleId"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "salary": salary,
        "email": email,
        "phoneNumber": phoneNumber,
        "workingPlaces": workingPlaces,
        "languages": languages,
        "skills": skills,
        "studyCenter": studyCenter,
        "about": about,
        "profilePicture": profilePicture,
        "bannerPicture": profilePicture,
        "passwordHash": passwordHash,
        "passwordSalt": passwordSalt,
        "roleId": roleId,
    };
}
