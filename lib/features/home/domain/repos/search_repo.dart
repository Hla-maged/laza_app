import 'package:dartz/dartz.dart';
import 'package:laza_app/core/errors/failure.dart';
import 'package:laza_app/features/home/domain/entities/search_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<SearchEntity>>> search({required String query});
}
