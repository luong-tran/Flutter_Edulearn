import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repos/category_repository.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;

  CategoryBloc(this._categoryRepository) : super(const CategoryState()) {
    on<LoadCategoryEvent>(((event, emit) async {
      emit(CategoryLoadingState());
      try {
        final groups = await _categoryRepository.requestListGroup();
        emit(CategoryLoadedState(groups));
      } catch (e) {
        emit(CategoryErrorState(e.toString()));
      }
    }));
  }
}
