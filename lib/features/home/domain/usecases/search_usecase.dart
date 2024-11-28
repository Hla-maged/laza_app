import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failure.dart';
import 'package:laza_app/features/home/domain/entities/search_entity.dart';
import '../repos/search_repo.dart';

class SearchUsecase extends UseCase<List<SearchEntity>, String> {
  final SearchRepo searchRepo;

  SearchUsecase({required this.searchRepo});
  @override
  Future<Either<Failure, List<SearchEntity>>> call(String query) async {
    return await searchRepo.search(query: query);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
