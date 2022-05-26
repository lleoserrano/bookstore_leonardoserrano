import 'dart:convert';

extension PaginationParamsModelExtension on PaginationParamsModel {
  void resetPagination() {
    startIndex = 0;
    hasMore = true;
  }

  void addPagination(int totalItems) {
    startIndex += (totalItems - startIndex) >= maxResults
        ? maxResults
        : (totalItems - startIndex);

    checkHasMore(totalItems);
  }

  void checkHasMore(int totalItems) {
    if (startIndex == totalItems) {
      hasMore = false;
    }
  }

  String getParamsUrl() => '&maxResults=$maxResults&startIndex=$startIndex';
}

class PaginationParamsModel {
  ///Index page
  int startIndex;

  //Has more items
  bool hasMore;

  final int maxResults;

  PaginationParamsModel({
    this.startIndex = 0,
    this.hasMore = true,
    required this.maxResults,
  });

  Map<String, dynamic> toMap() {
    return {
      'startIndex': startIndex,
      'hasMore': hasMore,
      'maxResults': maxResults,
    };
  }

  String toJson() => json.encode(toMap());
}
