import 'package:finance_gestor/app/features/bills/controllers/bills_controller.dart';
import 'package:finance_gestor/app/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BillsController(),
        )
      ],
      builder: (context, child) => MyApp(),
    ));
