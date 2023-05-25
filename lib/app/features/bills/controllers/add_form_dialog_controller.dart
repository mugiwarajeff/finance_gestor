import 'package:flutter/material.dart';

class AddFormDialogController {
  final TextEditingController _nameInputController = TextEditingController();

  final TextEditingController _valueInputController = TextEditingController();

  final TextEditingController _dueDateInputController = TextEditingController();

  final TextEditingController _descriptionInputController =
      TextEditingController();

  DateTime? _selectedDueDate;

  TextEditingController get nameInputController => _nameInputController;

  TextEditingController get valueInputController => _valueInputController;
  TextEditingController get dueDateInputController => _dueDateInputController;
  TextEditingController get descriptionInputController =>
      _descriptionInputController;

  void cancelButtonFuntion(BuildContext context) {
    Navigator.pop(context);
  }

  void confirmButtonFunction(BuildContext context) {
    print(_nameInputController.text);
    print(_valueInputController.text);
    print(_dueDateInputController.text);
    print(_descriptionInputController.text);
  }

  Future<void> getDatePicker(BuildContext context) async {
    DateTime? dueDate = await showDatePicker(
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

    _setSelectedDate(dueDate);
  }

  void _setSelectedDate(DateTime? dueDate) {
    if (dueDate != null) {
      _selectedDueDate = dueDate;
      _dueDateInputController.text =
          "${dueDate.day}/${dueDate.month}/${dueDate.year}";
    }
  }
}
