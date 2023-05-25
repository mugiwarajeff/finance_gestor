import 'package:finance_gestor/app/features/bills/controllers/add_form_dialog_controller.dart';
import 'package:finance_gestor/app/features/bills/widgets/add_form_dialog/add_form_input.dart';
import 'package:flutter/material.dart';

class AddFormDialog extends StatelessWidget {
  final AddFormDialogController addFormDialogController =
      AddFormDialogController();
  AddFormDialog({super.key});

  final String prinipalTitle = "Adding a bill";

  final double titleSize = 24;

  @override
  Widget build(BuildContext context) {
    final double screenSize = MediaQuery.of(context).size.height;
    final double dialogSize = screenSize * 0.7;

    const String labelName = "Name";
    const String hintName = "Insert the name of bill";
    const String labelValue = "Value";
    const String hintValue = "Inser the value of bill";
    const String labelDate = "Due Date";
    const String hintDate = "Insert the Due Date of Bill";
    const String labelDescription = "Description";
    const String hintDescription = "Insert a description of bill";

    const String confirmText = "Confirm";
    const String cancelText = "Cancel";
    return Dialog(
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
                        addFormDialogController.nameInputController,
                  ),
                  AddFormInput(
                    labelText: labelValue,
                    hintText: hintValue,
                    icon: Icons.monetization_on_outlined,
                    textInputType: TextInputType.number,
                    textEditingController:
                        addFormDialogController.valueInputController,
                  ),
                  AddFormInput(
                    labelText: labelDate,
                    hintText: hintDate,
                    icon: Icons.calendar_month,
                    readOnly: true,
                    textInputType: TextInputType.datetime,
                    onTap: () async {
                      addFormDialogController.getDatePicker(context);
                    },
                    textEditingController:
                        addFormDialogController.dueDateInputController,
                  ),
                  AddFormInput(
                    labelText: labelDescription,
                    hintText: hintDescription,
                    icon: Icons.abc,
                    textInputType: TextInputType.text,
                    quantLine: 8,
                    textEditingController:
                        addFormDialogController.descriptionInputController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextButton(
                            onPressed: () => addFormDialogController
                                .confirmButtonFunction(context),
                            child: const Text(confirmText)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextButton(
                            onPressed: () => addFormDialogController
                                .cancelButtonFuntion(context),
                            child: const Text(cancelText)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
