import 'package:flutter/foundation.dart';
import 'package:mi_proyecto/models/job_offer/job_offer_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;

import '../../../global/environment.dart';

class JobOfferProvider with ChangeNotifier {
  List<JobOffer> currentJobOffers = [];
  List<JobOffer> savedJobOffers = [];
  late JobOffer jobOffer;


  JobOfferProvider()
  {
    this.getJobOffers();
  }

  getJobOfferById(int id) async {
    var url = Uri.http('https://jobagdb.azurewebsites.net','/api/JobOffer/Get?jobOfferId=${id}');
    final response = await http.get(url);
    final jobOffersResponse = JobOfferResponse.fromJson(response.body);
    //this.savedJobOffers = jobOffersResponse.data;
    notifyListeners();
    return jobOffersResponse;
  }

  getJobOffers() async {
    var url = Uri.http('https://jobagdb.azurewebsites.net', '/api/JobOffer/GetAll');
    final response = await http.get(url);
    final jobOffersResponse = JobOfferResponse.fromJson(response.body);
    this.currentJobOffers = jobOffersResponse.data;
    notifyListeners();
  }

  Future<JobOffer> createJobOffer (JobOffer jobOffer) async {
    notifyListeners();
    
    this.jobOffer = jobOffer;
    final url = Uri.http( 'https://jobagdb.azurewebsites.net', '/api/JobOffer/Add');
    final resp = await http.put(
      url,
      body: this.jobOffer.toJson(),
      headers: {
      'Content-Type': 'application/json'
        });
    final decodedData = resp.body;
    print(decodedData);
    

    notifyListeners();
    return this.jobOffer;
  }
}