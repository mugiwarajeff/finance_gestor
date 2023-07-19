import 'package:finance_gestor/database/database_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainTasks {
  static Future<void> initFireBase() async {
    await Firebase.initializeApp();
  }

  static void configureCrashlytics() {
    if (!kDebugMode) {
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
    }
  }

  static Future<void> initDatabase() async {
    await DatabaseHelper.initDatabase();
  }
}
