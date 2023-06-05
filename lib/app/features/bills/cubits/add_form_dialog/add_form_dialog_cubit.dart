import 'package:finance_gestor/app/features/bills/cubits/add_form_dialog/add_form_dialog_states.dart';
import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_bloc.dart';
import 'package:finance_gestor/app/features/bills/models/bill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFormDialogCubit extends Cubit<AddFormDialogState> {
  final TextEditingController _nameInputController = TextEditingController();

  final TextEditingController _valueInputController = TextEditingController();

  final TextEditingController _dueDateInputController = TextEditingController();

  final TextEditingController _descriptionInputController =
      TextEditingController();

  DateTime? _selectedDueDate;

  String _nameError = "";
  String _valueError = "";
  String _dateError = "";

  TextEditingController get nameInputController => _nameInputController;

  TextEditingController get valueInputController => _valueInputController;
  TextEditingController get dueDateInputController => _dueDateInputController;
  TextEditingController get descriptionInputController =>
      _descriptionInputController;

  DateTime? get selectedDueDate => _selectedDueDate;

  AddFormDialogCubit() : super(InitialAddFormDialogState()) {
    emit(LoadedAddFormDialogState());
  }

  void closeDialog(BuildContext context) {
    Navigator.pop(context);
  }

  void confirmAddBill(BuildContext context) {
    if (_validateFields()) {
      BillsListCubit billsListCubit =
          BlocProvider.of<BillsListCubit>(context, listen: false);

      Bill newBill = Bill(
          name: nameInputController.text,
          value: double.tryParse(valueInputController.text)!,
          dueDate: _selectedDueDate!,
          paid: false);

      billsListCubit.addNewBill(newBill);

      emit(SentState());
    }
  }

  bool _validateFields() {
    _nameError = _validateName();
    _valueError = _validateValue();
    _dateError = _validateDueDate();

    if (_nameError.isNotEmpty ||
        _valueError.isNotEmpty ||
        _dateError.isNotEmpty) {
      emit(UnvalidatedAddFormDialogState(
          dateError: _dateError.isEmpty ? null : _dateError,
          nameError: _nameError.isEmpty ? null : _nameError,
          valueError: _valueError.isEmpty ? null : _valueError));
      return false;
    }

    return true;
  }

  String _validateName() {
    if (_nameInputController.text.isEmpty) {
      return "Name is Blank";
    }
    return "";
  }

  String _validateValue() {
    if (_valueInputController.text.isEmpty) {
      return "Value is Blank";
    }

    if (double.tryParse(_valueInputController.text) == null) {
      return "Value is not a number";
    }
    return "";
  }

  String _validateDueDate() {
    if (_selectedDueDate == null) {
      return "Date is Blank";
    }

    return "";
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
