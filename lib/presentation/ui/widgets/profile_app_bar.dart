import 'package:flutter/material.dart';
import 'package:read_rover/presentation/ui/screens/auth/login_page.dart';
import 'package:read_rover/data/utils/auth_utils.dart';

class ProfileAppBar extends StatefulWidget implements PreferredSizeWidget {
 
 
  const ProfileAppBar({
    super.key,
  });

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(65);
}

class _ProfileAppBarState extends State<ProfileAppBar> {

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
    return GestureDetector(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const ProfilePage()));
      },
      child: AppBar(
        elevation: 00,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Text(
              userName,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            Text(
             userEmail,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                
              });
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const AboutPage()),
              // );
            },
            icon: const Icon(Icons.error_outline_rounded),
          ),
          IconButton(
            onPressed: ()  {
              // DialogBox.show(
              //   context: context,
              //   contentMessage: 'Do you want to log out?',
              //   leftButtonText: 'Cancel',
              //   rightButtonText: 'Log out',
              //   onLeftButtonPressed: () {
              //     Navigator.pop(context);
              //   },
              //   onRightButtonPressed: () async {
               AuthUtils.clearUserInfo();

         if(mounted)   {  Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false);}
              //   },
              // );
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
    );
  }
}
