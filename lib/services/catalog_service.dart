import '../models/api_response/api_response_model.dart';
import '../models/pagination_params/pagination_params_model.dart';

abstract class CatalogService {
  Future<ApiResponseModel> getListOfBooks(
      PaginationParamsModel paginationParams);
}
