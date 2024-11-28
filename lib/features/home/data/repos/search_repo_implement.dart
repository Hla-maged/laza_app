import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:laza_app/core/errors/failure.dart';
import 'package:laza_app/features/home/data/datasources/search_remote_data_source.dart';
import 'package:laza_app/features/home/domain/entities/search_entity.dart';
import 'package:laza_app/features/home/domain/repos/search_repo.dart';

class SearchRepoImplement extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImplement({required this.searchRemoteDataSource});
  @override
  Future<Either<Failure, List<SearchEntity>>> search(
      {required String query}) async {
    try {
      var products = await searchRemoteDataSource.search(query: query);
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
