import 'package:flutter/material.dart';
import 'package:read_rover/data/utils/auth_utils.dart';
import 'package:read_rover/presentation/ui/screens/user_screen.dart';
import 'package:read_rover/presentation/ui/utils/constraints.dart';
import 'package:read_rover/presentation/ui/widgets/appbar_iconbutton.dart';

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
    return AppBar(
      toolbarHeight: 100,
      elevation: 00,
      backgroundColor: myAppBarColor,
      title: Text(
        'Greetings, $userName.',
        style: myTextStyle.copyWith(fontSize: 20),
      ),
      centerTitle: false,
      actions: [
        AppBarIconButton(
          icon: Icons.dashboard_rounded,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserScreen(),
              ),
            );
          },
        ),
        const SizedBox(
          width: 16,
        )
      ],
    );
  }
}
