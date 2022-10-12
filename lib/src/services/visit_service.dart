import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gatey/src/models/message_model.dart';
import 'package:gatey/src/utilities/exception_utility.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class VisitService {

  static var _token;

  static getToken() async{
    const storage = FlutterSecureStorage();
    _token = await storage.read(key: "token");
  }
  
  static _headers() => {
    "Accept": "application/json",
    "Authorization": "Bearer "+_token
  };

  Future<Message> CreateVisit(nationalId, name, phone, destination) async{
    await getToken();
    var url = Uri.parse("http://project.techara.co.ke/api/visits");

    var payload = {
      "national_id": nationalId,
      "name": name,
      "phone": phone,
      "destination": destination
    };

    try {
      var response = await http.post(url, body: payload, headers: _headers());
      return _response(response);
      
    } on SocketException {
      throw FetchDataException('Error','Unable to run the request at the moment. Please try again later.');
    }
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var res = Message.fromJson(jsonDecode(response.body));
        return res;
      case 400:
        throw BadRequestException('Error', 'The credentials provided do not match.');
      case 401:
      case 402:
         throw UnAuthorizedException('Unauthorized', 'Oops! You are not authorized to perform the action.');
      case 500:
      default:
        throw FetchDataException('Error', 'Unable to run the request at the moment. Please try again later.');
    }
  }
}