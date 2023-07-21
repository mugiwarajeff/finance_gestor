import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_bloc.dart';
import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_states.dart';
import 'package:finance_gestor/app/features/bills/widgets/bills_list/empty_page.dart';
import 'package:finance_gestor/app/features/bills/widgets/bills_list/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bill_card.dart';

class BillsList extends StatelessWidget {
  final BillsListCubit billsListCubit;
  const BillsList({super.key, required this.billsListCubit});

  @override
  Widget build(BuildContext context) {
    billsListCubit.loadBills();

    return BlocListener<BillsListCubit, BillsListState>(
      bloc: billsListCubit,
      listener: (context, state) {
        if (state is BillsListError) {
          showDialog(
              context: context,
              builder: (context) => ErrorDialog(
                    billsErrorType: state.errorType,
                    context: context,
                  ));
        }
      },
      child: BlocBuilder(
        bloc: billsListCubit,
        builder: (context, BillsListState state) {
          if (state is BillsListInitial) {
            return const EmptyPage();
          } else if (state is BillsListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BillsListLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) => BillCard(
                bill: state.bills.elementAt(index),
                dismissibleKey: Key("${state.bills.elementAt(index)}"),
                onDelete: () =>
                    billsListCubit.deleteBill(state.bills.elementAt(index)),
              ),
              itemCount: state.bills.length,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
