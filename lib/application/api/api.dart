class Api {
  Api._();

  // Não gosto de manter url na app, o ideal aqui era um serviço como Firebase Remote Config, para buscar a Url quando a app iniciar.
  // Permitindo manutenção em produção.
  static const baseUrl =
      'https://www.googleapis.com/books/v1/volumes?q=flutter';
}
