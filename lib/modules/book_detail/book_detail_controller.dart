import 'package:url_launcher/url_launcher.dart';

import '../../application/notifier/default_change_notifier.dart';
import '../../models/book/book_model.dart';
import '../../models/exception/load_page_exception.dart';
import '../../services/database_service.dart';

class BookDetailController extends DefaultChangeNotifier {
  final DatabaseService _databaseService;
  BookDetailController({
    required DatabaseService databaseService,
  }) : _databaseService = databaseService;

  BookModel? _bookModel;
  BookModel? get getBookModel => _bookModel;
  set setBookModel(BookModel? model) => _bookModel = model;

  bool _isFavorite = false;
  bool get getIsFavorite => _isFavorite;

  Future<void> updateIsFavorite() async {
    _isFavorite = !_isFavorite;

    if (_isFavorite) {
      await saveFavorite(_bookModel!.id);
    } else {
      await removeFavorite(_bookModel!.id);
    }
    notifyListeners();
  }

  Future<void> receviedBook(BookModel? model) async {
    setBookModel = model;
    if (_bookModel != null) {
      success();
      await checkIsFavorite();
    } else {
      setError(LoadPageException());
      notifyListeners();
    }
  }

  Future<void> saveFavorite(String id) async => await _databaseService.save(id);

  Future<void> removeFavorite(String id) async =>
      await _databaseService.updateListFav(id);

  Future<void> checkIsFavorite() async {
    await _databaseService.checkContainId(_bookModel!.id).then(
          (value) => _isFavorite = value,
        );
    notifyListeners();
  }

  Future<void> launchLinkToBuy() => launchUrl(
        Uri.parse(
          _bookModel!.saleInfo.buyLink!,
        ),
      );
}
