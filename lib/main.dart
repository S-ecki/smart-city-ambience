import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:smart_city_ambience/Authentification/Service/AuthService.dart';
import 'package:smart_city_ambience/routing/smort_routes.dart';
import 'package:smart_city_ambience/theme/smort_theme.dart';
import 'Authentification/Widgets/AuthWrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthServcice>(
          create: (_) => AuthServcice(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) => context.read<AuthServcice>().authStateChanges)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: smortTheme(context),
        home: AuthWrapper(),
        routes: SmortRoutes.myRoutes,
      ),
    );
  }
}
