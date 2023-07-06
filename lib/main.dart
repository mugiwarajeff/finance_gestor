import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_bloc.dart';
import 'package:finance_gestor/app/main_tasks.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'database/daos/bills_dao.dart';
import 'database/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BillsDAO billsDao = BillsDAO(database: await DatabaseHelper.getDataBase());

  await MainTasks.initFireBase();
  MainTasks.configureCrashlytics();

  return runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => BillsListCubit(billsDAO: billsDao),
      ),
    ],
    child: MyApp(),
  ));
}
