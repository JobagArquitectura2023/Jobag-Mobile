import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mi_proyecto/models/postulant/postulant_response_model.dart';
import 'package:mi_proyecto/models/saved_job_offer/saved_job_offer.dart';
import 'package:mi_proyecto/providers/job_offer/job_offers_provider.dart';

import '../../global/environment.dart';
import '../../models/company/company_model.dart';
import '../../models/company/company_response_login.dart';
import '../../models/job_offer/job_offer_model.dart';
import '../../models/postulant/postulant_model.dart';

class CompanyServiceProvider with ChangeNotifier {
  List<JobOffer> valor = [];

  bool _autenticando = false;
  late Company company;

  CompanyServiceProvider(
  );

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  final _storage = new FlutterSecureStorage();

  bool get autenticando => this._autenticando;

  set autenticando( bool valor ) {
    this._autenticando = valor;
    notifyListeners();
  }

  static Future<String?> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }
  
  Future<bool> login( String email, String password ) async {
    this.autenticando = true;

    final data = {
      'email': email,
      'password': password
    };

    final uri = Uri.parse('${Environment.apiUrl}/Company/Login');

    final resp = await http.post( uri, 
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    this.autenticando=false;

    if (resp.statusCode == 200)
    {
      final loginResponse = CompanyResponseLogin.fromJson(resp.body);
      this.company = loginResponse.data.company;

      this._guardarToken(loginResponse.data.token);
      return true;
    }
    else{
      return false;
    }
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    await _storage.delete(key: 'token');
  }

  Future<Company> updatePostulant(Company company) async {
    notifyListeners();
    
    if (company.id != null)
    {
      this.company = company;
      final url = Uri.http( 'https://jobagdb.azurewebsites.net', '/api/Company/Update');
      final resp = await http.put(
        url,
        body: this.company.toJson(),
        headers: {
        'Content-Type': 'application/json'
          });
      final decodedData = resp.body;
      print(decodedData);
    }

    notifyListeners();
    return this.company;
  }

  Future<Company> getCompany(int id) async {
    var url = Uri.http('https://jobagdb.azurewebsites.net','/api/Company/Get?companyId=$id');
    final response = await http.get(url);
    final companyResponse = CompanyResponseLogin.fromJson(response.body);
    print(companyResponse);
    this.company = companyResponse.data.company;
    notifyListeners();
    return company;
  }
}