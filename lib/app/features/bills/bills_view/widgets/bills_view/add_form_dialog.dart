import 'package:finance_gestor/app/features/bills/bills_view/models/interfaces/bill.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/isolated_bill.dart';
import 'package:finance_gestor/app/features/bills/bills_view/widgets/bills_view/add_form_dialog/input_type.dart';
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

  final Bill newBill = IsolatedBill.empty();

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
                                      newBill.name.value = newName,
                                  icon: Icons.abc,
                                  textInputType: TextInputType.name,
                                  value: newBill.name),
                              AddFormInput(
                                labelText: labelValue,
                                hintText: hintValue,
                                inputType: InputType.standard,
                                icon: Icons.monetization_on_outlined,
                                textInputType: TextInputType.number,
                                value: newBill.value,
                                onChange: (newValue) => newBill.value.value =
                                    double.tryParse(newValue) ?? 0,
                              ),
                              AddFormInput(
                                  labelText: labelDate,
                                  hintText: hintDate,
                                  inputType: InputType.date,
                                  icon: Icons.calendar_month,
                                  readOnly: true,
                                  textInputType: TextInputType.datetime,
                                  value: newBill.dueDate,
                                  onChange: (dateString) => newBill.dueDate
                                      .value = DateTime.parse(dateString)),
                              AddFormInput(
                                labelText: labelDescription,
                                hintText: hintDescription,
                                inputType: InputType.standard,
                                icon: Icons.abc,
                                textInputType: TextInputType.text,
                                value: newBill.description,
                                onChange: (text) =>
                                    newBill.description.value = text,
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
                                            addFormDialogCubit
                                                .confirmAddBill(newBill);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "(Fields are not Validated!)"),
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
