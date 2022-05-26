import 'abstract_exception.dart';

class FormatExceptionApp implements AbstractException {
  @override
  String messageUserView;

  @override
  String hardBody;

  @override
  String statusCode;

  FormatExceptionApp({
    this.messageUserView =
        'Sorry, there was a problem connecting to the server. If it persists, contact the team.',
    required this.hardBody,
    this.statusCode = 'Format Exception',
  });
}
