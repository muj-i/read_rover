import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:read_rover/ui/auth/login_page.dart';
import 'package:read_rover/data/utils/auth_utils.dart';
import 'package:read_rover/ui/home_page.dart';

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
    Future.delayed(const Duration(seconds: 1)).then(
      (_) async {
        final bool isLoggedIn = await AuthUtils.checkIfUserLoggedIn();

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    isLoggedIn ? HomePage( )//!BottomNavBasePage() 
                    : LoginPage()),
            (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Center(
          //child: SvgPicture.asset(
           //AssetUtils.logoSVG,
           // width: 125,
            //fit: BoxFit.scaleDown,
         // ),
        ),
      
    );
  }
}
