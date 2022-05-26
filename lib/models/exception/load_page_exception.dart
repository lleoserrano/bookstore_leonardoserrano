import 'abstract_exception.dart';

class LoadPageException implements AbstractException {
  @override
  String messageUserView;

  @override
  String hardBody;

  @override
  String statusCode;

  LoadPageException({
    this.messageUserView = 'Sorry. Error load the page.',
    this.hardBody = '',
    this.statusCode = 'Load Page Exception',
  });
}
