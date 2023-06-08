// To parse this JSON data, do
//
//     final companyResponse = companyResponseFromMap(jsonString);

import 'dart:convert';

import 'company_model.dart';

class CompanyResponseLogin {
    CompanyResponseLogin({
        this.message,
        required this.data,
        required this.warning,
    });

    dynamic message;
    Data data;
    bool warning;

    factory CompanyResponseLogin.fromJson(String str) => CompanyResponseLogin.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CompanyResponseLogin.fromMap(Map<String, dynamic> json) => CompanyResponseLogin(
        message: json["message"],
        data: Data.fromMap(json["data"]),
        warning: json["warning"],
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "data": data.toMap(),
        "warning": warning,
    };
}

class Data {
    Data({
        required this.token,
        required this.company,
    });

    String token;
    Company company;

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        token: json["token"],
        company: Company.fromMap(json["company"]),
    );

    Map<String, dynamic> toMap() => {
        "token": token,
        "company": company.toMap(),
    };
}

