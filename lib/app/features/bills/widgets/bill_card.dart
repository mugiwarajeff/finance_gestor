import 'package:finance_gestor/app/features/bills/cubits/bill_card/card_cubit.dart';
import 'package:finance_gestor/app/features/bills/cubits/bill_card/card_state.dart';
import 'package:finance_gestor/app/features/bills/models/bill.dart';
import 'package:finance_gestor/app/features/bills/widgets/bill_card/card_trailing.dart';
import 'package:finance_gestor/app/shared/widgets/confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillCard extends StatelessWidget {
  final double iconSize = 30;
  final Bill bill;
  final Key dismissibleKey;
  final void Function() onDelete;
  late final CardCubit cardCubit;

  BillCard(
      {super.key,
      required this.bill,
      required this.dismissibleKey,
      required this.onDelete}) {
    cardCubit = CardCubit(bill);
  }

  @override
  Widget build(BuildContext context) {
    final String dismissText = AppLocalizations.of(context)!.deleteBill;
    const double rightLeft = 16;
    const Color dismissItemColor = Colors.white;

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed("/bills/edit"),
      child: Dismissible(
        key: dismissibleKey,
        background: Container(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.only(right: rightLeft),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    dismissText,
                    style: TextStyle(color: dismissItemColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.delete,
                    color: dismissItemColor,
                  ),
                ],
              ),
            )),
        confirmDismiss: (direction) async {
          bool value = await showDialog(
            context: context,
            builder: (context) => const ConfirmDialog(),
          );

          return value;
        },
        onDismissed: (direction) => onDelete(),
        direction: DismissDirection.endToStart,
        child: Card(
            child: Align(
          alignment: Alignment.center,
          child: ListTile(
            title: Text(
                "R\$ ${bill.value.toStringAsFixed(2).replaceAll(".", ",")}"),
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
        )),
      ),
    );
  }
}
