import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intravel/common/textInputField.dart';
import 'package:intravel/common/validator.dart';
import 'package:intravel/constants/constant.dart';
import 'package:intravel/constants/toast_helper.dart';
import 'package:intravel/theme/app_colors.dart';
import 'package:intravel/view/home_screen.dart';
import 'package:intravel/view/recover_password.dart';
import 'package:intravel/view/register_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  bool _visible = true;
  bool _onHover = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }

  _loginClick() async {
    if (formGlobalKey.currentState != null) {
      if (formGlobalKey.currentState!.validate()) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Login Successfully',
          ),
          backgroundColor: Colors.green.shade700,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Enter Required Information'),
          backgroundColor: Colors.red.shade700,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white60,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      weight: 700,
                    )),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Welcome back!',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 28),
                        ),
                      ),
                      const Text(
                        'Login to your existing account!',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Form(
                            key: formGlobalKey,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () => FocusScope.of(context).unfocus(),
                                  child: TextInputField(
                                      label: 'Email',
                                      controller: _emailController,
                                      enabled: true,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) =>
                                          Validator.validateEmailId(value!),
                                      hint: 'xyz@gmail.com',
                                      showLabel: true),
                                ),
                                GestureDetector(
                                  onTap: () => FocusScope.of(context).unfocus(),
                                  child: TextInputField(
                                    label: 'Password',
                                    controller: _passwordController,
                                    enabled: true,
                                    showLabel: true,
                                    obsecure: _visible,
                                    validator: (value) =>
                                        Validator.validatePasswordSignUp(
                                            value!),
                                    keyboardType: TextInputType.text,
                                    suffix: IconButton(
                                      icon: _visible
                                          ? Icon(
                                              Icons.visibility_outlined,
                                              color: Colors.grey.shade700,
                                              size: 18,
                                            )
                                          : Icon(
                                              Icons.visibility_off_outlined,
                                              color: Colors.grey.shade700,
                                              size: 18,
                                            ),
                                      onPressed: () {
                                        _toggle();
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: InkWell(
                                      highlightColor: Colors.red.shade700,
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RecoverPassword()));
                                      },
                                      child: const Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _loginClick();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.primaryButtonColor,
                                        foregroundColor: Colors.white),
                                    child: const Text(
                                      'Log in',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                const Text.rich(
                                    textAlign: TextAlign.center,
                                    TextSpan(children: [
                                      TextSpan(
                                          text:
                                              "By clicking the 'Login' button you accept the terms of the",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13)),
                                      TextSpan(
                                          text: ' Privacy Policy',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13))
                                    ])),
                              ],
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 30),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Expanded(
                                  child: Divider(
                                color: Colors.black54,
                                thickness: 2,
                              )),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 3.0, right: 10, left: 10),
                                child: Text(
                                  "or",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(
                                  child: Divider(
                                color: Colors.black54,
                                thickness: 2,
                              )),
                            ]),
                      ),
                      InkWell(
                        onTap: () {},
                        highlightColor: Colors.grey.shade600,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 50,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.apple,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                'Continue with Apple',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: InkWell(
                          onTap: () {},
                          highlightColor: Colors.grey.shade600,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.only(top: 13, bottom: 13),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 3),
                                  width: 50,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Image.asset(
                                      'assets/icons/google.png',
                                      height: 16,
                                      width: 16,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0.0),
                                  child: Text('Continue with Google',
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        highlightColor: Colors.grey.shade600,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                              top: 10, left: 15, bottom: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 50,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.facebook,
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                              ),
                              Text('Continue with Facebook',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        width: MediaQuery.of(context).size.width,
                        child: Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(children: [
                              const TextSpan(text: 'No account?'),
                              WidgetSpan(
                                  child: InkWell(
                                mouseCursor: SystemMouseCursors.click,
                                highlightColor: Colors.red.shade900,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterScreen()));
                                },
                                child: Text(
                                  ' Sign in',
                                  style: TextStyle(
                                      color: Colors.pink.shade700,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ))
                            ])),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
