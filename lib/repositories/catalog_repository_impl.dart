import 'dart:convert';

import '../application/api/api.dart';
import '../application/rest_client/rest_client.dart';
import '../models/api_response/api_response_model.dart';

import '../models/exception/connection_exception.dart';
import '../models/exception/format_exception_app.dart';
import '../models/pagination_params/pagination_params_model.dart';
import 'catalog_repository.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  final RestClient _restClient;

  CatalogRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<ApiResponseModel> getListOfBooks(
      PaginationParamsModel paginationParams) async {
    final response = await _restClient.get(
      Uri.parse(
        Api.baseUrl + paginationParams.getParamsUrl(),
      ),
    );

    if (response.statusCode != 200) {
      throw ConnectionException(
        statusCode: response.statusCode.toString(),
        hardBody: response.body,
      );
    } else {
      try {
        return ApiResponseModel.fromJson(json.decode(response.body));
      } catch (e) {
        if (e == FormatException) {
          e as FormatException;
          throw FormatExceptionApp(
            hardBody: e.message,
          );
        } else {
          rethrow;
        }
      }
    }
  }
}
