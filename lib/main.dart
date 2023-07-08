import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:snapsearch/features/auth/screens/authscreen.dart';
import 'package:snapsearch/features/auth/services/auth_services.dart';
import 'package:snapsearch/features/home/screens/homescreen.dart';
import 'package:snapsearch/provider/user_provider.dart';
import 'package:snapsearch/router.dart';

Future<void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: const Size(414, 896),
      builder: (context,child){
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SnapSearch',
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty? const HomeScreen():const AuthScreen()
    );
    });
    
    
  }
}