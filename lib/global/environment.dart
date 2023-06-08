import 'dart:io';

class Environment {
  static String apiUrl    = Platform.isAndroid ? 'https://jobagdb.azurewebsites.net' : 'https://jobagdb.azurewebsites.net';
  static String socketUrl = Platform.isAndroid ? 'https://jobagdb.azurewebsites.net' : 'https://jobagdb.azurewebsites.net';
}