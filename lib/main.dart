import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventlyapp/Home%20Screen/home_screen.dart';
import 'package:eventlyapp/Home%20Screen/tabs/home_tab/widget/edit_event.dart';
import 'package:eventlyapp/Home%20Screen/tabs/profile%20tab/profile_screen.dart';
import 'package:eventlyapp/Providers/app_language_provider.dart';
import 'package:eventlyapp/Providers/app_theme_provider.dart';
import 'package:eventlyapp/add%20event/add_event_screen.dart';
import 'package:eventlyapp/authentication/login/login_screen.dart';
import 'package:eventlyapp/authentication/register/register_screen.dart';
import 'package:eventlyapp/generated/l10n.dart';
import 'package:eventlyapp/onBording_Screens/IntroPage.dart';
import 'package:eventlyapp/onBording_Screens/OnbordingScreen.dart';
import 'package:eventlyapp/utils/app_routes.dart';
import 'package:eventlyapp/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreferences.getInstance();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
    ChangeNotifierProvider(create: (context) => AppThemeProvider())
  ], child: EventlyApp()));
  await FirebaseFirestore.instance.disableNetwork();
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(languageProvider.appLanguage),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: AppRoutes.onbording,
      routes: {
        AppRoutes.homescreen: (context) => HomeScreen(),
        AppRoutes.loginScreen: (context) => LoginScreen(),
        AppRoutes.registerScreen: (context) => RegisterScreen(),
        AppRoutes.profileTab: (context) => ProfileScreen(),
        AppRoutes.onbording: (context) => Intropage(),
        AppRoutes.introductionScreen: (context) => IntroductionScreen(),
        AppRoutes.addevent: (context) => AddEventScreen(),
        AppRoutes.editEvent: (context) => EditEvent(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
    );
  }
}
