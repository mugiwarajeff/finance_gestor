import 'package:finance_gestor/app/features/bills/cubits/add_form_dialog/add_form_dialog_states.dart';
import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_bloc.dart';
import 'package:finance_gestor/app/features/bills/models/bill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFormDialogCubit extends Cubit<AddFormDialogState> {
  final BillsListCubit billsListCubit;
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

  set selectedDueDate(DateTime? dateTime) {
    _selectedDueDate = dateTime;
  }

  AddFormDialogCubit({required this.billsListCubit})
      : super(InitialAddFormDialogState()) {
    emit(LoadingAddFormDialogState());
    _loadForm();
  }

  void closeDialog(BuildContext context) {
    Navigator.pop(context);
  }

  void _loadForm() {
    emit(LoadedAddFormDialogState());
  }

  void confirmAddBill(BuildContext context) {
    if (_validateFields(context)) {
      Bill newBill = Bill(
          name: nameInputController.text,
          value: double.tryParse(valueInputController.text)!,
          dueDate: _selectedDueDate!,
          paid: false);

      billsListCubit.addNewBill(newBill);

      emit(SentState());
    } else {
      emit(UnvalidatedAddFormDialogState(
          dateError: _dateError.isEmpty ? null : _dateError,
          nameError: _nameError.isEmpty ? null : _nameError,
          valueError: _valueError.isEmpty ? null : _valueError));
    }
  }

  bool _validateFields(BuildContext context) {
    _nameError = _validateName(context);
    _valueError = _validateValue(context);
    _dateError = _validateDueDate(context);

    if (_nameError.isNotEmpty ||
        _valueError.isNotEmpty ||
        _dateError.isNotEmpty) {
      return false;
    }

    return true;
  }

  String _validateName(BuildContext context) {
    if (_nameInputController.text.isEmpty) {
      return AppLocalizations.of(context)!.nameIsBlank;
    }
    return "";
  }

  String _validateValue(BuildContext context) {
    if (_valueInputController.text.isEmpty) {
      return AppLocalizations.of(context)!.valueIsBlank;
    }

    if (double.tryParse(_valueInputController.text) == null) {
      return AppLocalizations.of(context)!.valueIsNotNumber;
    }
    return "";
  }

  String _validateDueDate(BuildContext context) {
    if (_selectedDueDate == null) {
      return AppLocalizations.of(context)!.dateIsBlank;
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
