// To parse this JSON data, do
//
//     final savedJobOfferResponse = savedJobOfferResponseFromMap(jsonString);

import 'dart:convert';

class SavedJobOfferResponse {
    SavedJobOfferResponse({
        this.message,
        required this.data,
        required this.warning,
    });

    dynamic message;
    List<SavedJobOffer> data;
    bool warning;

    factory SavedJobOfferResponse.fromJson(String str) => SavedJobOfferResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SavedJobOfferResponse.fromMap(Map<String, dynamic> json) => SavedJobOfferResponse(
        message: json["message"],
        data: List<SavedJobOffer>.from(json["data"].map((x) => SavedJobOffer.fromMap(x))),
        warning: json["warning"],
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "warning": warning,
    };
}

class SavedJobOffer {
    SavedJobOffer({
        required this.id,
        required this.postulantId,
        required this.jobOfferId,
    });

    int id;
    int postulantId;
    int jobOfferId;

    factory SavedJobOffer.fromJson(String str) => SavedJobOffer.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SavedJobOffer.fromMap(Map<String, dynamic> json) => SavedJobOffer(
        id: json["id"],
        postulantId: json["postulantId"],
        jobOfferId: json["jobOfferId"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "postulantId": postulantId,
        "jobOfferId": jobOfferId,
    };
}
