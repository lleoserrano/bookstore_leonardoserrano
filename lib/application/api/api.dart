class Api {
  Api._();

  // I don't like to keep the url in the app, the ideal here was a service like Firebase Remote Config, to fetch the Url when the app starts.
  // Allowing maintenance in production.
  static const baseUrl =
      'https://www.googleapis.com/books/v1/volumes?q=flutter';
}
