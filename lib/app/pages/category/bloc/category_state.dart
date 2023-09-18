import 'package:edu_learn_app/data/models/group_model.dart';

class CategoryState {
  const CategoryState();
}

class CategoryLoadingState extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryLoadedState extends CategoryState {
  CategoryLoadedState(this.groups);
  final List<GroupResponse> groups;

  @override
  List<Object?> get props => [groups];
}

class CategoryErrorState extends CategoryState {
  CategoryErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
