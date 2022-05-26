import 'package:flutter/foundation.dart';

import '../../application/notifier/default_change_notifier.dart';
import '../../models/book/book_model.dart';
import '../../services/catalog_service.dart';

import '../../models/pagination_params/pagination_params_model.dart';

class HomeController extends DefaultChangeNotifier {
  final CatalogService _catalogService;

  HomeController({required CatalogService catalogService})
      : _catalogService = catalogService;

  ///List of All Books
  List<BookModel> allBooks = [];

  ///Controller of pagination
  final _paginationParamsModel = PaginationParamsModel(maxResults: 20);
  bool get hasMoreItems => _paginationParamsModel.hasMore;

  Future<void> getListOfBooks({bool isPullToRefresh = false}) async {
    if (isPullToRefresh) {
      showLoadingAndResetState();
      allBooks.clear();
      _paginationParamsModel.resetPagination();
    } else {
      showLoading();
    }
    notifyListeners();

    debugPrint(_paginationParamsModel.toJson());
    await _catalogService.getListOfBooks(_paginationParamsModel).then((value) {
      allBooks.addAll(value.items);
      _paginationParamsModel.addPagination(value.totalItems);
      success();
    }).catchError((e) {
      setError(e);
    });

    hideLoading();
    notifyListeners();
  }
}
