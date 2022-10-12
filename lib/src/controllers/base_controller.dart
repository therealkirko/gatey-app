import 'package:gatey/src/utilities/dialog_utility.dart';
import 'package:gatey/src/utilities/exception_utility.dart';

class BaseController {
  void handleError(error)
  {
    if (error is BadRequestException) {
      DialogHelper.showErrorDialog(message: error.message);
    } else if(error is FetchDataException) {
      DialogHelper.showErrorDialog(message: error.message);
    } else if(error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(message: error.message);
    }
  }
}