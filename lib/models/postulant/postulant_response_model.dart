import 'dart:convert';

import 'package:mi_proyecto/models/postulant/postulant_model.dart';

PostulantLogin postulantLoginFromJson(String str) => PostulantLogin.fromJson(str);
String postulantLoginToJson(PostulantLogin data) => json.encode(data.toJson());

class PostulantLogin {
    PostulantLogin({
        this.message,
        required this.data,
        required this.warning,
    });

    dynamic message;
    Data data;
    bool warning;

    factory PostulantLogin.fromJson(String str) => PostulantLogin.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PostulantLogin.fromMap(Map<String, dynamic> json) => PostulantLogin(
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
        required this.postulant,
    });

    String token;
    Postulant postulant;

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        token: json["token"],
        postulant: Postulant.fromMap(json["postulant"]),
    );

    Map<String, dynamic> toMap() => {
        "token": token,
        "postulant": postulant.toMap(),
    };
}

