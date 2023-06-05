import 'package:finance_gestor/app/features/bills/cubits/add_form_dialog/add_form_dialog_cubit.dart';
import 'package:finance_gestor/app/features/bills/cubits/add_form_dialog/add_form_dialog_states.dart';
import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_bloc.dart';
import 'package:finance_gestor/app/features/bills/widgets/add_form_dialog/add_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/bill.dart';

class AddFormDialog extends StatelessWidget {
  final AddFormDialogCubit addFormDialogCubit = AddFormDialogCubit();
  AddFormDialog({super.key});

  final String prinipalTitle = "Adding a bill";

  final double titleSize = 24;

  @override
  Widget build(BuildContext context) {
    final double screenSize = MediaQuery.of(context).size.height;
    final double dialogSize = screenSize * 0.7;

    const String labelName = "* Name";
    const String hintName = "Insert the name of bill";
    const String labelValue = "* Value";
    const String hintValue = "Inser the value of bill";
    const String labelDate = "* Due Date";
    const String hintDate = "Insert the Due Date of Bill";
    const String labelDescription = "Description";
    const String hintDescription = "Insert a description of bill";

    const String confirmText = "Confirm";
    const String cancelText = "Cancel";
    return Dialog(
      child: BlocBuilder<AddFormDialogCubit, AddFormDialogState>(
          bloc: addFormDialogCubit,
          builder: (context, state) {
            if (state is LoadedAddFormDialogState ||
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
                              style: TextStyle(fontSize: titleSize),
                            ),
                            AddFormInput(
                              labelText: labelName,
                              hintText: hintName,
                              icon: Icons.abc,
                              textInputType: TextInputType.name,
                              textEditingController:
                                  addFormDialogCubit.nameInputController,
                              errorText:
                                  (state is UnvalidatedAddFormDialogState)
                                      ? state.nameError
                                      : null,
                            ),
                            AddFormInput(
                              labelText: labelValue,
                              hintText: hintValue,
                              icon: Icons.monetization_on_outlined,
                              textInputType: TextInputType.number,
                              textEditingController:
                                  addFormDialogCubit.valueInputController,
                              errorText:
                                  (state is UnvalidatedAddFormDialogState)
                                      ? state.valueError
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
                              errorText:
                                  (state is UnvalidatedAddFormDialogState)
                                      ? state.dateError
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
                                          addFormDialogCubit.confirmAddBill(
                                              context), //TODO mudar isso pra um listener
                                      child: const Text(confirmText)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: TextButton(
                                      onPressed: () =>
                                          addFormDialogCubit.closeDialog(
                                              context), //TODO mudar isso pra um listener
                                      child: const Text(cancelText)),
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
