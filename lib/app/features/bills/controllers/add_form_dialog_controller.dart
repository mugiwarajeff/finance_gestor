import 'package:flutter/material.dart';

class AddFormDialogController {
  final TextEditingController _nameInputController = TextEditingController();

  final TextEditingController _valueInputController = TextEditingController();

  final TextEditingController _dueDateInputController = TextEditingController();

  final TextEditingController _descriptionInputController =
      TextEditingController();

  TextEditingController get nameInputController => _nameInputController;

  TextEditingController get valueInputController => _valueInputController;
  TextEditingController get dueDateInputController => _dueDateInputController;
  TextEditingController get descriptionInputController =>
      _descriptionInputController;

  void cancelButtonFuntion(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> trigguerDatePicker(BuildContext context) async {
    DateTime? data = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2050),
      builder: (context, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 500,
            child: child,
          ),
        ],
      ),
    );

    if (data != null) {
      print(data.toString());
      _dueDateInputController.text = data.toString();
      print(_dueDateInputController.text);
    }
  }
}
