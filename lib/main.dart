import 'package:flutter/material.dart';
import 'package:ng_alumni/screens/welcome.dart';
import 'package:ng_alumni/user_form/register.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  print('Starting the app...');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  print('Firebase initialized successfully.');

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('Building MyApp widget...');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => RegisterForm())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: welcome(),
        // home: UserProfileDetails(passuserProfile: null)
        // home: FivethPage(),
      ),
    );
  }
}



