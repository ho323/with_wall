import 'package:flutter/material.dart';
import 'package:with_wall/screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // 플러터 프레임워크 준비될 때까지 대기

  await initializeDateFormatting();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'with-wall-ca104',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}
