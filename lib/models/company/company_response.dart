// To parse this JSON data, do
//
//     final companyResponse = companyResponseFromMap(jsonString);

import 'dart:convert';

import 'company_model.dart';

class CompanyResponse {
    CompanyResponse({
        this.message,
        required this.data,
        required this.warning,
    });

    dynamic message;
    Company data;
    bool warning;

    factory CompanyResponse.fromJson(String str) => CompanyResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CompanyResponse.fromMap(Map<String, dynamic> json) => CompanyResponse(
        message: json["message"],
        data: Company.fromMap(json["data"]),
        warning: json["warning"],
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "data": data.toMap(),
        "warning": warning,
    };
}
