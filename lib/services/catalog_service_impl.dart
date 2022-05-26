import '../models/api_response/api_response_model.dart';

import '../models/pagination_params/pagination_params_model.dart';
import '../repositories/catalog_repository.dart';
import 'catalog_service.dart';

class CatalogServiceImpl implements CatalogService {
  final CatalogRepository _catalogRepository;

  CatalogServiceImpl({required CatalogRepository catalogRepository})
      : _catalogRepository = catalogRepository;

  @override
  Future<ApiResponseModel> getListOfBooks(
          PaginationParamsModel paginationParams) async =>
      await _catalogRepository.getListOfBooks(paginationParams);
}
