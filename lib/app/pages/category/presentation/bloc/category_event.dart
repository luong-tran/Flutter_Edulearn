abstract class CategoryEvent {
  const CategoryEvent();
}

class LoadCategoryEvent extends CategoryEvent {
  @override
  List<Object?> get props => [];
}
