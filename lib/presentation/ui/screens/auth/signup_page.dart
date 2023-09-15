import 'package:flutter/material.dart';
import 'package:read_rover/data/model/network_response.dart';
import 'package:read_rover/data/model/signup_model.dart';
import 'package:read_rover/data/services/network_caller.dart';
import 'package:read_rover/data/utils/auth_utils.dart';
import 'package:read_rover/data/utils/urls.dart';
import 'package:read_rover/presentation/ui/screens/auth/login_page.dart';
import 'package:read_rover/presentation/ui/screens/home_page.dart';
import 'package:read_rover/presentation/ui/widgets/constraints.dart';

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
      // Map<String, dynamic> requestBody = {
      //   "email": _emailController.text.trim(),
      //   "password": _passWordController.text,
      // };
      // final NetworkResponse response =
      //     await NetworkCaller().postRequest(Urls.login, requestBody);
      // if (response.isSuccess) {
      //   AuthUtils.saveUserInfo(LoginModel.fromJson(response.body!));
      //   setState(() {});
      SignupModel model = SignupModel.fromJson(response.body!);
      AuthUtils.saveSignupUserInfo(model);
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const HomePage() //!BottomNavBasePage()
                ),
            (route) => false);
      }
      // }
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
                height: 100,
              ),
              Text(
                'Hello There',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: myTextColor),
              ),
              Text(
                'Register below with your details',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: myTextColor),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset(
                  'assets/images/signup.png',
                  //width: 125,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Enter Name',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: myOtherTextColor),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Name',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter your name";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Enter Email Address',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: myOtherTextColor),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Email Your Address',
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
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Enter Password',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: myOtherTextColor),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextFormField(
                  controller: _passWordController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
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
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                child: Visibility(
                  visible: _signUpInProgress == false,
                  replacement: const Center(child: CircularProgressIndicator()),
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
          "Already have account?",
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
