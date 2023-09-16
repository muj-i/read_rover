import 'package:flutter/material.dart';
import 'package:read_rover/data/utils/auth_utils.dart';
import 'package:read_rover/presentation/ui/screens/getstarted_screen.dart';
import 'package:read_rover/presentation/ui/screens/home_screen.dart';
import 'package:read_rover/presentation/ui/utils/assets_images.dart';

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
    Future.delayed(const Duration(seconds: 2)).then(
      (_) async {
        final bool isLoggedIn = await AuthUtils.checkIfUserLoggedIn();

        if (mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  isLoggedIn ? const HomeScreen() : const GetstartedScreen(),
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
               AppImageAssets.logIn,
             width: 350,
              fit: BoxFit.fill,
            ),
          ),
          const Text(
            'ReadRover',
            style: TextStyle(fontSize: 22),
          ),
          const Text(
            'Your one-stop book library.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
