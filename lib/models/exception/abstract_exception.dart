abstract class AbstractException implements Exception {
  ///Message to show on View
  abstract String messageUserView;

  /// Represents response.body - To resend to the server or report and analyze.
  abstract String hardBody;

  /// Represents Status Code
  abstract String statusCode;
}
