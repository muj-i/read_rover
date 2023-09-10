import 'package:flutter/material.dart';
//import 'package:read_rover/auth/email_verify_page.dart';
import 'package:read_rover/ui/auth/signup_page.dart';
import 'package:read_rover/data/model/login_model.dart';
import 'package:read_rover/data/model/network_response.dart';
import 'package:read_rover/data/services/network_caller.dart';
import 'package:read_rover/data/utils/auth_utils.dart';
import 'package:read_rover/data/utils/urls.dart';
import 'package:read_rover/ui/home_page.dart';
import 'package:read_rover/ui/widgets/constraints.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  bool _obscurePassword = true, _logInProgress = false;

  Future<void> logIn() async {
    _logInProgress = true;
    if (mounted) {
      setState(() {});
    }

    Map<String, dynamic> requestBody = {
      "email": _emailController.text.trim(),
      "password": _passWordController.text
    };
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.login, requestBody);
    _logInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      LoginModel model = LoginModel.fromJson(response.body!);
      AuthUtils.saveUserInfo(model);
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>  HomePage() //!BottomNavBasePage()
                ),
            (route) => false);
      }
      setState(() {});
    } else {
      if (mounted) {
        CustomSnackbar.show(
            context: context, message: 'Incorrect email address or password');
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150,
              ),
              Text(
                'Get Started With',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 16,
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
                  if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
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
                obscureText: _obscurePassword,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
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
                  if ((value?.isEmpty ?? true) || value!.length <= 5) {
                    return "Enter your password";
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
                  visible: _logInProgress == false,
                  replacement: const Center(child: CircularProgressIndicator()),
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      logIn();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const HomePage()));
                    },
                    child: Text('Log In', style: myButtonTextColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // //
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
          "Don't have account?",
          style: myTextStyle,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SignupPage()),
                (route) => false);
          },
          child: Text(
            "Sign Up",
            style: myTextButtonStyle,
          ),
        )
      ],
    );
  }
}
