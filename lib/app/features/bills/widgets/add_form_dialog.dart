import 'package:finance_gestor/app/features/bills/cubits/add_form_dialog/add_form_dialog_cubit.dart';
import 'package:finance_gestor/app/features/bills/cubits/add_form_dialog/add_form_dialog_states.dart';
import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_bloc.dart';
import 'package:finance_gestor/app/features/bills/widgets/add_form_dialog/add_form_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/form_unvalidated_state.dart';

class AddFormDialog extends StatelessWidget {
  late final AddFormDialogCubit addFormDialogCubit;
  final BillsListCubit billsListCubit;
  AddFormDialog({super.key, required this.billsListCubit}) {
    addFormDialogCubit = AddFormDialogCubit(billsListCubit: billsListCubit);
  }

  @override
  Widget build(BuildContext context) {
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
            } else if (state is LoadedAddFormDialogState ||
                state is UnvalidatedAddFormDialogState) {
              return BlocListener<AddFormDialogCubit, AddFormDialogState>(
                bloc: addFormDialogCubit,
                listener: (context, state) {
                  if (state is SentState) {
                    Navigator.of(context).pop();
                  }
                },
                child: SizedBox(
                    height: dialogSize,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
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
                              icon: Icons.abc,
                              textInputType: TextInputType.name,
                              textEditingController:
                                  addFormDialogCubit.nameInputController,
                              unvalidatedType: (state
                                      is UnvalidatedAddFormDialogState)
                                  ? state.unvalidatedTypes
                                          .contains(UnvalidatedTypes.nameBlank)
                                      ? UnvalidatedTypes.nameBlank
                                      : null
                                  : null,
                            ),
                            AddFormInput(
                              labelText: labelValue,
                              hintText: hintValue,
                              icon: Icons.monetization_on_outlined,
                              textInputType: TextInputType.number,
                              textEditingController:
                                  addFormDialogCubit.valueInputController,
                              unvalidatedType: (state
                                      is UnvalidatedAddFormDialogState)
                                  ? state.unvalidatedTypes
                                          .contains(UnvalidatedTypes.valueBlank)
                                      ? UnvalidatedTypes.valueBlank
                                      : state.unvalidatedTypes.contains(
                                              UnvalidatedTypes.valueNotNumeric)
                                          ? UnvalidatedTypes.valueNotNumeric
                                          : null
                                  : null,
                            ),
                            AddFormInput(
                              labelText: labelDate,
                              hintText: hintDate,
                              icon: Icons.calendar_month,
                              readOnly: true,
                              textInputType: TextInputType.datetime,
                              onTap: () async {
                                addFormDialogCubit.getDatePicker(context);
                              },
                              textEditingController:
                                  addFormDialogCubit.dueDateInputController,
                              unvalidatedType: (state
                                      is UnvalidatedAddFormDialogState)
                                  ? state.unvalidatedTypes
                                          .contains(UnvalidatedTypes.dateBlank)
                                      ? UnvalidatedTypes.dateBlank
                                      : null
                                  : null,
                            ),
                            AddFormInput(
                              labelText: labelDescription,
                              hintText: hintDescription,
                              icon: Icons.abc,
                              textInputType: TextInputType.text,
                              quantLine: 8,
                              textEditingController:
                                  addFormDialogCubit.descriptionInputController,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: TextButton(
                                      onPressed: () =>
                                          addFormDialogCubit.confirmAddBill(),
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
                    )),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
