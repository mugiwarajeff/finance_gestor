import 'package:finance_gestor/app/features/bills/bills_view/models/enuns/bill_type.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/recorrency_bill.dart';
import 'package:finance_gestor/app/features/bills/bills_view/widgets/bills_view/add_form_dialog/add_form_button_segment.dart';
import 'package:finance_gestor/app/features/bills/bills_view/widgets/bills_view/add_form_dialog/add_form_dropdown.dart';
import 'package:finance_gestor/app/features/bills/bills_view/widgets/bills_view/add_form_dialog/input_type.dart';
import 'package:finance_gestor/app/features/categories/cubit/categories_list_cubit.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/add_form_dialog/add_form_dialog_cubit.dart';
import '../../cubits/add_form_dialog/add_form_dialog_states.dart';
import '../../cubits/bills_list/bills_list_bloc.dart';
import 'add_form_dialog/add_form_input.dart';

class AddFormDialog extends StatelessWidget {
  late final AddFormDialogCubit addFormDialogCubit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final BillsListCubit billsListCubit;
  AddFormDialog({super.key, required this.billsListCubit}) {
    addFormDialogCubit = AddFormDialogCubit(billsListCubit: billsListCubit);
  }

  @override
  Widget build(BuildContext context) {
    final CategoriesListCubit categoriesListCubit =
        BlocProvider.of<CategoriesListCubit>(context);
    final double screenSize = MediaQuery.of(context).size.height;
    final double dialogSize = screenSize * 0.7;

    final String prinipalTitle = AppLocalizations.of(context)!.addingBill;
    const double titleSize = 24;

    final String labelName = "* ${AppLocalizations.of(context)!.name}";
    final String hintName = AppLocalizations.of(context)!.hintName;
    final String labelValue = "* ${AppLocalizations.of(context)!.value}";
    final String hintValue = AppLocalizations.of(context)!.hintValue;
    final String labelDate = "* ${AppLocalizations.of(context)!.dueDate}";
    final String hintDate = AppLocalizations.of(context)!.hintDueDate;
    final String categoryLabel = AppLocalizations.of(context)!.category;
    final String categoryHint = AppLocalizations.of(context)!.selectCategory;
    final String limitRecorrencyLabel =
        AppLocalizations.of(context)!.recorrencyLimit;

    final String fieldNotValidatedAlert =
        AppLocalizations.of(context)!.fieldsAreNotValidated;
    final String labelDescription =
        "* ${AppLocalizations.of(context)!.description}";
    final String hintDescription =
        AppLocalizations.of(context)!.hintDescription;
    final String confirmText = AppLocalizations.of(context)!.confirm;
    final String cancelText = AppLocalizations.of(context)!.cancel;

    return Dialog(
      child: BlocBuilder<AddFormDialogCubit, AddFormDialogState>(
          bloc: addFormDialogCubit,
          builder: (context, state) {
            if (state is InitialAddFormDialogState) {
              return Container();
            } else if (state is LoadingAddFormDialogState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadedAddFormDialogState) {
              return BlocListener<AddFormDialogCubit, AddFormDialogState>(
                bloc: addFormDialogCubit,
                listener: (context, state) {
                  if (state is SentState) {
                    Navigator.of(context).pop();
                  }
                },
                child: SizedBox(
                    width: double.infinity,
                    height: dialogSize,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                prinipalTitle,
                                style: const TextStyle(fontSize: titleSize),
                              ),
                              AddFormInput(
                                  labelText: labelName,
                                  hintText: hintName,
                                  inputType: InputType.standard,
                                  onChange: (newName) =>
                                      state.newBill.name.value = newName,
                                  icon: Icons.person,
                                  textInputType: TextInputType.name,
                                  value: state.newBill.name),
                              AddFormInput(
                                labelText: labelValue,
                                hintText: hintValue,
                                inputType: InputType.standard,
                                icon: Icons.monetization_on_outlined,
                                textInputType: TextInputType.number,
                                value: state.newBill.value,
                                onChange: (newValue) => state.newBill.value
                                    .value = double.tryParse(newValue) ?? 0,
                              ),
                              AddFormInput(
                                  labelText: labelDate,
                                  hintText: hintDate,
                                  inputType: InputType.date,
                                  icon: Icons.calendar_month,
                                  readOnly: true,
                                  textInputType: TextInputType.datetime,
                                  value: state.newBill.dueDate,
                                  onChange: (dateString) => state
                                      .newBill
                                      .dueDate
                                      .value = DateTime.parse(dateString)),
                              AddFormDropdown(
                                label: categoryLabel,
                                value: state.newBill.category
                                  ..value =
                                      categoriesListCubit.categories.first,
                                hint: categoryHint,
                                validatedValues: categoriesListCubit.categories
                                    .map((category) => category)
                                    .toList(),
                                icon: Icons.category,
                                onChange: (selectedCategory) => state
                                    .newBill.category.value = selectedCategory,
                              ),
                              AddFormButtonSegment<BillType>(
                                selectedValue: state.billType,
                                values: BillType.values,
                                onChange: addFormDialogCubit.onChangeBillType,
                              ),
                              AddFormInput(
                                  disabled:
                                      state.billType.first == BillType.isolated,
                                  hintText: limitRecorrencyLabel,
                                  labelText: limitRecorrencyLabel,
                                  value: (state.newBill as RecorrencyBill)
                                      .limitRecorrency,
                                  onChange: (newLimit) =>
                                      (state.newBill as RecorrencyBill)
                                          .limitRecorrency
                                          .value = int.tryParse(newLimit) ?? 0,
                                  inputType: InputType.standard,
                                  textInputType: TextInputType.number),
                              AddFormInput(
                                labelText: labelDescription,
                                hintText: hintDescription,
                                inputType: InputType.standard,
                                icon: Icons.description,
                                textInputType: TextInputType.text,
                                value: state.newBill.description,
                                onChange: (text) =>
                                    state.newBill.description.value = text,
                                quantLine: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: TextButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            addFormDialogCubit.confirmAddBill();
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content:
                                                  Text(fieldNotValidatedAlert),
                                              backgroundColor: Colors.red,
                                            ));
                                          }
                                        },
                                        child: Text(confirmText)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: TextButton(
                                        onPressed: () => addFormDialogCubit
                                            .closeDialog(context),
                                        child: Text(cancelText)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
