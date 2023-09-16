import 'package:flutter/material.dart';
import 'package:read_rover/presentation/ui/screens/auth/login_screen.dart';
import 'package:read_rover/presentation/ui/screens/auth/signup_screen.dart';
import 'package:read_rover/presentation/ui/utils/assets_images.dart';
import 'package:read_rover/presentation/ui/utils/color_palette.dart';
import 'package:read_rover/presentation/ui/utils/constraints.dart';

class GetstartedScreen extends StatefulWidget {
  const GetstartedScreen({super.key});

  @override
  State<GetstartedScreen> createState() => _GetstartedScreenState();
}

class _GetstartedScreenState extends State<GetstartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Image.asset(
                AppImageAssets.people,
                //width: 125,
                fit: BoxFit.fill,
              ),
            ),
            const Text(
              'Your one-stop book library.',
              style: TextStyle(fontSize: 22),
            ),
            const Text(
              'Start reading your favorite book',
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    'Get Started',
                    style: elevatedButtonTextStyle,
                  ),
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
