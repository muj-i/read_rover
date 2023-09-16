import 'package:flutter/material.dart';
import 'package:read_rover/data/utils/auth_utils.dart';
import 'package:read_rover/presentation/ui/screens/auth/login_screen.dart';
import 'package:read_rover/presentation/ui/utils/assets_images.dart';
import 'package:read_rover/presentation/ui/utils/constraints.dart';
import 'package:read_rover/presentation/ui/widgets/about_sheets.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String userName = 'Loading...';
  String userEmail = '';

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    final userData = await AuthUtils.getUserInfo();
    setState(() {
      userName = userData.user?.name ?? 'No name found';
      userEmail = userData.user?.email ?? 'No email found';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myAppBarColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: myAppBarColor,
        title: Text(
          'User Information',
          style: myTextStyle,
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: myTextColor,
            )),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Image.asset(
                AppImageAssets.logIn,
                width: 350,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Name: $userName',
                style: const TextStyle(fontSize: 36),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Email: $userEmail',
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      AuthUtils.clearUserInfo();

                      if (mounted) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                            (route) => false);
                      }
                    },
                    child: Text(
                      'Log Out',
                      style: elevatedButtonTextStyle,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              GestureDetector(
                onTap: () {
                  aboutSheet();
                },
                child: Image.asset(
                  AppImageAssets.appLogo,
                  width: 50,
                  // fit: BoxFit,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text('App Version: 1.0.0'),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void aboutSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return const AboutSheet();
      },
    );
  }
}
