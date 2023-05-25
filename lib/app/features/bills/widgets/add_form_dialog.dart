import 'package:finance_gestor/app/features/bills/controllers/add_form_dialog_controller.dart';
import 'package:finance_gestor/app/features/bills/widgets/add_form_dialog/add_form_input.dart';
import 'package:flutter/material.dart';

class AddFormDialog extends StatefulWidget {
  final AddFormDialogController addFormDialogController =
      AddFormDialogController();
  AddFormDialog({super.key});

  @override
  State<AddFormDialog> createState() => _AddFormDialogState();
}

class _AddFormDialogState extends State<AddFormDialog> {
  final String prinipalTitle = "Adding a bill";

  final double titleSize = 24;

  @override
  Widget build(BuildContext context) {
    final double screenSize = MediaQuery.of(context).size.height;
    final double dialogSize = screenSize * 0.7;
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
                    labelText: "Name",
                    hintText: "Insert the name of bill",
                    icon: Icons.abc,
                    textEditingController:
                        widget.addFormDialogController.nameInputController,
                  ),
                  AddFormInput(
                    labelText: "Value",
                    hintText: "Insert the value of bill",
                    icon: Icons.monetization_on_outlined,
                    textEditingController:
                        widget.addFormDialogController.valueInputController,
                  ),
                  AddFormInput(
                    labelText: "Due Date",
                    hintText: "Insert the Due Date of Bill",
                    icon: Icons.calendar_month,
                    readOnly: true,
                    onTap: () async {
                      widget.addFormDialogController
                          .trigguerDatePicker(context);
                    },
                    textEditingController:
                        widget.addFormDialogController.dueDateInputController,
                  ),
                  AddFormInput(
                    labelText: "Description",
                    hintText: "Insert a description of bill",
                    icon: Icons.abc,
                    quantLine: 8,
                    textEditingController: widget
                        .addFormDialogController.descriptionInputController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextButton(
                            onPressed: () {}, child: const Text("Confirmar")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextButton(
                            onPressed: () => widget.addFormDialogController
                                .cancelButtonFuntion(context),
                            child: const Text("Cancelar")),
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
