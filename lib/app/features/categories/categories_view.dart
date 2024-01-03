import 'package:finance_gestor/app/features/bills/bills_view/cubits/add_form_dialog/add_form_dialog_states.dart';
import 'package:finance_gestor/app/features/categories/cubit/categories_list_cubit.dart';
import 'package:finance_gestor/app/features/categories/cubit/categories_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesView extends StatelessWidget {
  final String pageTitle = "(Categorias)";

  const CategoriesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: BlocBuilder<CategoriesListCubit, CategoriesListState>(
          builder: ((context, state) {
        if (state is InitialCategoriesListState) {
          return Container();
        } else if (state is LoadingAddFormDialogState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadedCategoriesListState) {
          return ListView(
            children: state.categories
                .map((category) => Card(
                      child: ListTile(
                        title: Text(category),
                      ),
                    ))
                .toList(),
          );
        } else if (state is ErrorCategoriesListState) {
          return const Text("(Error on getting categories)");
        } else {
          return Container();
        }
      })),
    );
  }
}
