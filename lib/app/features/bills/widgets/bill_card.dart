import 'package:finance_gestor/app/features/bills/cubits/bill_card/card_cubit.dart';
import 'package:finance_gestor/app/features/bills/cubits/bill_card/card_state.dart';
import 'package:finance_gestor/app/features/bills/models/bill.dart';
import 'package:finance_gestor/app/features/bills/widgets/bill_card/card_trailing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillCard extends StatelessWidget {
  final double iconSize = 30;
  final Bill bill;
  late final CardCubit cardCubit;

  BillCard({super.key, required this.bill}) {
    cardCubit = CardCubit(bill);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Align(
      alignment: Alignment.center,
      child: ListTile(
        title:
            Text("R\$ ${bill.value.toStringAsFixed(2).replaceAll(".", ",")}"),
        subtitle: Text(bill.name),
        leading: SizedBox(
          height: double.infinity,
          child: Icon(
            Icons.monetization_on,
            size: iconSize,
          ),
        ),
        trailing: BlocBuilder<CardCubit, CardState>(
            bloc: cardCubit,
            builder: (context, state) {
              if (state is InitialCardState) {
                return Container();
              } else if (state is LoadingCardState) {
                return const CircularProgressIndicator();
              } else if (state is LoadedCardState) {
                return CardTrailin(
                  principalColor: state.principalColor,
                  secondaryColor: state.secondaryColor,
                  billStates: state.billStates,
                );
              } else {
                return Container();
              }
            }),
      ),
    ));
  }
}
