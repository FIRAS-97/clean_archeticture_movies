import 'package:clean_archeticture_movies/movies/presntaion/controller/bloc_sign_in_out/sign_in_out_bloc.dart';
import 'package:clean_archeticture_movies/movies/presntaion/screens/movies_screen.dart';
import 'package:clean_archeticture_movies/movies/presntaion/screens/sign_in_screen.dart';
import 'package:clean_archeticture_movies/movies/presntaion/screens/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/service/service_local.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInOutBloc(),
      child: MaterialApp(
        initialRoute: SigInScreen.id,
        routes: {
          SigInScreen.id: (context) => SigInScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          MainMoviesScreen.id: (context) => MainMoviesScreen(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900,
        ),
        // MainMoviesScreen(),
      ),
    );
    // return BlocProvider(create: (context) {
    //   return MoviesBloc(sl())..add(GetNowPlayingEvent());
    // }, child: BlocBuilder<MoviesBloc, MoviesState>(
    //   builder: ((context, state) {
    //     return const Scaffold();
    //   }),
    // ));
  }
}
