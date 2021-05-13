import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:smart_city_ambience/Authentification/Service/AuthService.dart';
import 'package:smart_city_ambience/dummyData/dummyComments.dart';
import 'package:smart_city_ambience/dummyData/dummyEvents.dart';
import 'package:smart_city_ambience/redux/reactionsState.dart';
import 'package:smart_city_ambience/redux/reactionsState.reducer.dart';
import 'package:smart_city_ambience/routing/smort_routes.dart';
import 'package:smart_city_ambience/theme/smort_theme.dart';
import 'Authentification/Widgets/AuthWrapper.dart';
import "package:redux/redux.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Store<ReactionsState> store = Store<ReactionsState>(
    reactionsStateReducer,
    initialState: ReactionsState(
      enhancedEmojis: {dummyEvents[0].eventId: [], dummyEvents[1].eventId: []},
      comments: dummyComments,
    ),
  );

  @override
  Widget build(BuildContext context) {
    print(store);

    return StoreProvider<ReactionsState>(
      store: store,
      child: MultiProvider(
        providers: [
          Provider<AuthServcice>(
            create: (_) => AuthServcice(FirebaseAuth.instance),
          ),
          StreamProvider(
              create: (context) =>
                  context.read<AuthServcice>().authStateChanges),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: smortTheme(context),
          home: AuthWrapper(),
          routes: SmortRoutes.myRoutes,
        ),
      ),
    );
  }
}
