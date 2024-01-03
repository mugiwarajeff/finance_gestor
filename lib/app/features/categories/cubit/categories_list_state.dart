abstract class CategoriesListState {}

class InitialCategoriesListState extends CategoriesListState {}

class LoadingCategoriesListState extends CategoriesListState {}

class LoadedCategoriesListState extends CategoriesListState {
  final List<String> categories;

  LoadedCategoriesListState({required this.categories});
}

class ErrorCategoriesListState extends CategoriesListState {}
