import 'package:finance_gestor/app/features/bills/models/bill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFormDialogController {
  final TextEditingController _nameInputController = TextEditingController();

  final TextEditingController _valueInputController = TextEditingController();

  final TextEditingController _dueDateInputController = TextEditingController();

  final TextEditingController _descriptionInputController =
      TextEditingController();

  DateTime? _selectedDueDate;

  bool _nameIsValid = true;

  bool _valueIsValid = true;

  bool _dueDateIsValid = true;

  TextEditingController get nameInputController => _nameInputController;

  TextEditingController get valueInputController => _valueInputController;
  TextEditingController get dueDateInputController => _dueDateInputController;
  TextEditingController get descriptionInputController =>
      _descriptionInputController;

  DateTime? get selectedDueDate => _selectedDueDate;

  bool get nameIsValid => _nameIsValid;

  bool get valueIsValid => _valueIsValid;

  bool get dueDateIsValid => _dueDateIsValid;

  void closeDialog(BuildContext context) {
    Navigator.pop(context);
  }

  void confirmButtonFunction(BuildContext context) {
    _validateNameField();
    _validateValueField();
    _validateDueDateFiel();

    if (_nameIsValid && _valueIsValid && _dueDateIsValid) {
      Bill newBill = Bill(
          name: _nameInputController.text,
          dueDate: _selectedDueDate!,
          value: double.tryParse(
                _valueInputController.text,
              ) ??
              0,
          paid: false);

      closeDialog(context);
    } else {
      print("unvalidated"); //problema de estados
    }
  }

  void _validateNameField() {
    _nameIsValid = nameInputController.text != "";
  }

  void _validateValueField() {
    _valueIsValid = valueInputController.text != "";
  }

  void _validateDueDateFiel() {
    _dueDateIsValid = selectedDueDate != null;
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
