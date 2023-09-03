import 'package:flutter/material.dart';
import 'package:read_rover/auth/login_page.dart';
import 'package:read_rover/data/model/login_model.dart';
import 'package:read_rover/data/model/network_response.dart';
import 'package:read_rover/data/services/network_caller.dart';
import 'package:read_rover/data/utils/auth_utils.dart';
import 'package:read_rover/data/utils/urls.dart';
import 'package:read_rover/home_page.dart';
import 'package:read_rover/widgets/constraints.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  bool _obscurePassword = true, _signUpInProgress = false;

  Future<void> userSignUp() async {
    _signUpInProgress = true;
    if (mounted) {
      setState(() {});
    }

    Map<String, dynamic> requestBody = {
      "name": _nameController.text.trim(),
      "email": _emailController.text.trim(),
      "password": _passWordController.text,
    };

    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.signup, requestBody);
    _signUpInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      Map<String, dynamic> requestBody = {
        "email": _emailController.text.trim(),
        "password": _passWordController.text,
      };
      final NetworkResponse response =
          await NetworkCaller().postRequest(Urls.login, requestBody);
      if (response.isSuccess) {
        AuthUtils.saveUserInfo(LoginModel.fromJson(response.body!));
        setState(() {});
        if (mounted) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomePage() //!BottomNavBasePage()
                  ),
              (route) => false);
        }
      }
      setState(() {});
      if (mounted) {
        CustomSnackbar.show(context: context, message: 'Sign up successful');
      }
    } else {
      if (mounted) {
        CustomSnackbar.show(context: context, message: 'Sign up failed');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Text(
                    'Join With Us',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: 'First Name',
                      // prefixIcon: Icon(
                      //   FontAwesomeIcons.userLarge,
                      //   size: 19,
                      // ),
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter your first name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: 'Email Address',
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        size: 22,
                      ),
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter your email address";
                      }
                      if (!RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                          .hasMatch(value!)) {
                        return "Enter a valid email address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _passWordController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(
                        Icons.lock_rounded,
                        size: 22,
                      ),
                      suffixIcon: IconButton(
                        color: myColor,
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: (String? value) {
                      if ((value?.isEmpty ?? true) || value!.length <= 7) {
                        return "Minimum password length should be 8";
                      }
                      final RegExp passwordRegex = RegExp(
                          r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

                      if (!passwordRegex.hasMatch(value)) {
                        return "Password should contain \nletters, numbers, and symbols.";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: _signUpInProgress == false,
                      replacement:
                          const Center(child: CircularProgressIndicator()),
                      child: ElevatedButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          userSignUp()
                              // .then((value) =>
                              //     Navigator.pushAndRemoveUntil(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => const LoginPage()),
                              //         (route) => false))
                              ;
                        },
                        child: Text('Sign Up', style: myButtonTextColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  signUpOption()
                ],
              ),
            ),
          ),
        ));
  } //sign up option method

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Have account?",
          style: myTextStyle,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false);
          },
          child: Text(
            "Log in",
            style: myTextButtonStyle,
          ),
        )
      ],
    );
  }
}
