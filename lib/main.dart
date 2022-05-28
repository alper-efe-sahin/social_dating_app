import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_dating_app/firebase_options.dart';
import 'package:social_dating_app/presentation/core/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const AppWidget(),
  );
}
