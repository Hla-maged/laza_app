import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/search_entity.dart';
import '../../../domain/usecases/search_usecase.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUsecase) : super(SearchLoading());
  final SearchUsecase searchUsecase;

  Future<void> search({required String query}) async {
    var result = await searchUsecase.call(query);
    result.fold((failure) {
      emit(SearchFailure(failure.errMessage));
    }, (products) {
      emit(SearchSuccess(products));
    });
  }
}
