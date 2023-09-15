import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:read_rover/data/utils/auth_utils.dart';
import 'package:read_rover/presentation/ui/screens/auth/login_page.dart';
import 'package:read_rover/presentation/ui/screens/getstarted_screen.dart';
import 'package:read_rover/presentation/ui/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToLoginPage();
    super.initState();
  }

  void navigateToLoginPage() {
    Future.delayed(const Duration(seconds: 3)).then(
      (_) async {
        final bool isLoggedIn = await AuthUtils.checkIfUserLoggedIn();

        if (mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => isLoggedIn
                  ? const HomePage() 
                  : const GetstartedScreen(),
            ),
            (route) => false,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   // backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
              height: 200,
            ),
            Center(
              child: Image.asset(
                'assets/images/people_read_books_digital.png',
                //width: 125,
                fit: BoxFit.fill,
              ),
            ),
            const Text(  'ReadRover'
             ,
              style: TextStyle(fontSize: 22),
            ),
            const Text( 'Your one-stop book library.',
            
              style: TextStyle(fontSize: 16),
            ),
            
        ],
      ),
    );
  }
}
