import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:gatey/src/models/token_model.dart';
import 'package:gatey/src/utilities/exception_utility.dart';

class AuthService {
  static _headers() => {
    "Accept": "application/json",
  };

  Future<Token> SignIn(email, password) async {
    var url = Uri.parse('http://project.techara.co.ke/api/login');

    var payload = {
      'email': email,
      'password': password
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
        var res = Token.fromJson(jsonDecode(response.body));
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