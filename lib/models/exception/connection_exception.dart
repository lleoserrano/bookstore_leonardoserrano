import 'abstract_exception.dart';

class ConnectionException implements AbstractException {
  @override
  String messageUserView;

  @override
  String hardBody;

  @override
  String statusCode;

  ConnectionException({
    this.messageUserView =
        'Sorry, there was a problem connecting to the server. If it persists, contact the team.',
    required this.hardBody,
    required this.statusCode,
  });
}
