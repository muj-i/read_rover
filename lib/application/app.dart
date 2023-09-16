import 'package:flutter/material.dart';
import 'package:read_rover/presentation/ui/screens/splash_screen.dart';
import 'package:read_rover/presentation/ui/utils/color_palette.dart';
import 'package:read_rover/presentation/ui/utils/constraints.dart';

class ReadRoverApp extends StatefulWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  const ReadRoverApp({super.key});

  @override
  State<ReadRoverApp> createState() => _ReadRoverAppState();
}

class _ReadRoverAppState extends State<ReadRoverApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: ReadRoverApp.navigatorKey,
      title: 'Progress Pal',
    
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: customSwatch,
          inputDecorationTheme: InputDecorationTheme(
              prefixIconColor: myColor,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 18,
              ),
              hintStyle: TextStyle(color: myColor),
              filled: true,
              fillColor: Colors.grey[50],
              focusColor: myColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:  BorderSide(color: Colors.grey.shade600),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:  BorderSide(color: Colors.grey.shade600),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 255, 0, 0)),
                // Customize the error border color
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 255, 0, 0)),
              ),
              errorStyle:
                  const TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
          textTheme: const TextTheme(
            
            titleLarge: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.6),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          snackBarTheme: const SnackBarThemeData(
            //backgroundColor: Color.fromARGB(255, 150, 108, 210),
            contentTextStyle: TextStyle(color: Colors.white, fontSize: 16),
          ),
         ),
          
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
