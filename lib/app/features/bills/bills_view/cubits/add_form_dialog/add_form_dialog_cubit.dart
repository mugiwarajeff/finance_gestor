import 'package:finance_gestor/app/features/bills/bills_view/cubits/add_form_dialog/add_form_dialog_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/bill.dart';
import '../../models/form_unvalidated_state.dart';
import '../bills_list/bills_list_bloc.dart';

class AddFormDialogCubit extends Cubit<AddFormDialogState> {
  final BillsListCubit billsListCubit;
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

  void confirmAddBill() {
    List<UnvalidatedTypes> unvalidatedTypes = _validateFields();
    if (unvalidatedTypes.isEmpty) {
      Bill newBill = Bill(
          name: nameInputController.text,
          value: double.tryParse(valueInputController.text)!,
          dueDate: _selectedDueDate!,
          paid: false);

      billsListCubit.addNewBill(newBill);

      emit(SentState());
    } else {
      emit(UnvalidatedAddFormDialogState(unvalidatedTypes: unvalidatedTypes));
    }
  }

  List<UnvalidatedTypes> _validateFields() {
    var nameIsValid = _validateName();
    var valueIsValid = _validateValue();
    var dateIsValid = _validateDueDate();

    List<UnvalidatedTypes> listUnvalidatedTypes = [];

    if (nameIsValid != null) listUnvalidatedTypes.add(nameIsValid);
    if (valueIsValid != null) listUnvalidatedTypes.add(valueIsValid);
    if (dateIsValid != null) listUnvalidatedTypes.add(dateIsValid);

    return listUnvalidatedTypes;
  }

  UnvalidatedTypes? _validateName() {
    if (_nameInputController.text.isEmpty) {
      return UnvalidatedTypes.nameBlank;
    }
    return null;
  }

  UnvalidatedTypes? _validateValue() {
    if (_valueInputController.text.isEmpty) {
      return UnvalidatedTypes.valueBlank;
    }

    if (double.tryParse(_valueInputController.text) == null) {
      return UnvalidatedTypes.valueNotNumeric;
    }
    return null;
  }

  UnvalidatedTypes? _validateDueDate() {
    if (_selectedDueDate == null) {
      return UnvalidatedTypes.dateBlank;
    }
    return null;
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
