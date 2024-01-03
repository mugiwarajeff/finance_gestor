import 'package:finance_gestor/app/features/categories/cubit/categories_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListCubit extends Cubit<CategoriesListState> {
  final List<String> categories = [
    "Crédito",
    "Manutenção Casa",
    "Entretenimento",
    "Outros"
  ];

  CategoriesListCubit() : super(InitialCategoriesListState()) {
    _loadCategories();
  }

  void _loadCategories() {
    emit(LoadingCategoriesListState());

    emit(LoadedCategoriesListState(categories: categories));
  }
}
