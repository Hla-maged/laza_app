import 'package:dio/dio.dart';

import '../../../../core/helper/api_service.dart';
import '../../domain/entities/search_entity.dart';
import '../models/search_model/search_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchEntity>> search({required String query});
}

class SearchRemoteDataSourceImplement extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImplement(this.apiService);
  @override
  Future<List<SearchEntity>> search({required String query}) async {
    final response = await apiService
        .get('http://laza.runasp.net/api/Product/Search?SearchTerm=$query');

    return convertData(response);
  }
}

List<SearchEntity> convertData(Response<dynamic> response) {
  final List<dynamic> data = response.data;
  List<SearchEntity> products = data.map((item) {
    final searchModel = SearchModel.fromJson(item as Map<String, dynamic>);
    return searchModel as SearchEntity;
  }).toList();
  return products;
}
