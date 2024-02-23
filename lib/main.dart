import 'package:exam_productive/assets/theme.dart';
import 'package:exam_productive/core/routes/app_route.dart';
import 'package:exam_productive/features/authentication/presentation/login/login_bloc.dart';
import 'package:exam_productive/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>AuthenticationBloc()),    
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Productive',
          theme: AppTheme.darkTheme(),
          navigatorKey: _navigatorKey,
          onGenerateRoute: RouteGenerator.onGenerateRoute,
        ),
      );
}