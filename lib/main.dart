import 'package:finance_gestor/app/features/bills/cubits/bills_list/bills_list_bloc.dart';
import 'package:finance_gestor/app/features/home/bloc/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';

void main() => runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BillsListCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        )
      ],
      child: MyApp(),
    ));
