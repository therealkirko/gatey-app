class ExceptionUtility implements Exception {
  final String? type;
  final String? message;

  ExceptionUtility([this.type, this.message]);
}

class BadRequestException extends ExceptionUtility{
  BadRequestException([String? type, String? message]) : super(type, message);
}

class FetchDataException extends ExceptionUtility{
  FetchDataException([String? type, String? message]) : super(type, message);
}

class ApiNotRespondingException extends ExceptionUtility{
  ApiNotRespondingException([String? type, String? message]) : super(type, message);
}

class UnAuthorizedException extends ExceptionUtility{
  UnAuthorizedException([String? type, String? message]) : super(type, message);
}

class NotFoundException extends ExceptionUtility{
  NotFoundException([String? type, String? message]) : super(type, message);
}