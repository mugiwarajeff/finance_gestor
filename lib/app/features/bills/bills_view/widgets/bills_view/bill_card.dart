import 'package:finance_gestor/app/features/bills/bills_edit/bills_edit.dart';
import 'package:finance_gestor/app/features/bills/bills_view/models/bill.dart';

import 'package:finance_gestor/app/shared/widgets/confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/bill_card/card_cubit.dart';
import '../../cubits/bill_card/card_state.dart';
import 'bill_card/card_trailing.dart';

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

    final Color deleteColor = Theme.of(context).colorScheme.errorContainer;
    final Color textDeleteColor =
        Theme.of(context).colorScheme.onErrorContainer;
    final Color iconTertiaryColor = Theme.of(context).colorScheme.tertiary;

    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BillsEdit(bill: bill),
      )),
      child: Dismissible(
        key: dismissibleKey,
        background: Container(
            color: deleteColor,
            child: Padding(
              padding: const EdgeInsets.only(right: rightLeft),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    dismissText,
                    style: TextStyle(color: textDeleteColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.delete,
                    color: textDeleteColor,
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
            title: Text(AppLocalizations.of(context)!.currency(bill
                .value)), //"R\$ ${bill.value.toStringAsFixed(2).replaceAll(".", ",")}"
            subtitle: Text(bill.name),
            leading: SizedBox(
              height: double.infinity,
              child: Icon(
                Icons.monetization_on,
                size: iconSize,
                color: iconTertiaryColor,
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
