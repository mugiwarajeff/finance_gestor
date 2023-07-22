import 'package:finance_gestor/app/features/bills/bills_edit/widgets/input_edit.dart';
import 'package:finance_gestor/app/features/bills/bills_edit/bloc/bill_edit_cubit.dart';
import 'package:finance_gestor/app/features/bills/bills_edit/bloc/bills_edit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bills_view/models/bill.dart';

class BillsEdit extends StatelessWidget {
  final double titleSize = 24;
  final Bill bill;
  late final BillEditCubit billEditCubit;

  BillsEdit({super.key, required this.bill}) {
    billEditCubit = BillEditCubit(bill: bill);
  }

  @override
  Widget build(BuildContext context) {
    final String billsEditText = AppLocalizations.of(context)!.billsEdit;
    return BlocBuilder<BillEditCubit, BillEditState>(
        bloc: billEditCubit,
        builder: (context, state) {
          if (state is LoadedBillEditState) {
            return Scaffold(
              appBar: AppBar(
                  title: Text("$billsEditText ${bill.name}"),
                  actions: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.save))
                  ]),
              body: SingleChildScrollView(
                child: Column(children: [
                  InputEdit(
                    inputIcon: Icons.abc,
                    controller: state.nameController,
                    readOnly: true,
                  ),
                  InputEdit(
                    inputIcon: Icons.money,
                    controller: state.valueController,
                  ),
                  InputEdit(
                    inputIcon: Icons.date_range,
                    controller: state.dateController,
                  ),
                  InputEdit(
                    inputIcon: Icons.description,
                    controller: state.descriptionController,
                    minLines: 5,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 250,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.check),
                                Text("(marcar como pago)")
                              ],
                            )),
                      ),
                    ),
                  )
                ]),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
