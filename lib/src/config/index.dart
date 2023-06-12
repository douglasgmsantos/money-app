import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:money/firebase_options.dart';

class Config {
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    initFirebase();
  }

  Future<void> initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
