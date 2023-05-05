import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intravel/view/login.dart';

import '../common/textInputField.dart';
import '../common/validator.dart';
import '../theme/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _phoneCode = TextEditingController(text: '+91');
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _visible = true;
  bool _confirmPasswordVisible = true;

  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }

  void _confirmPasswordToggle() {
    setState(() {
      _confirmPasswordVisible = !_confirmPasswordVisible;
    });
  }

  _registerClick() {
    if (formGlobalKey.currentState != null) {
      if (formGlobalKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Registered Successfully',
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
                        "Let's get started!",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 28),
                      ),
                    ),
                    const Text(
                      'To register enter your details',
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
                                    label: 'Full name:',
                                    controller: _fullNameController,
                                    enabled: true,
                                    keyboardType: TextInputType.name,
                                    validator: (value) =>
                                        Validator.validateName(value!),
                                    hint: 'Your name',
                                    showLabel: true),
                              ),
                              GestureDetector(
                                onTap: () => FocusScope.of(context).unfocus(),
                                child: TextInputField(
                                    label: 'Email:',
                                    controller: _emailController,
                                    enabled: true,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) =>
                                        Validator.validateEmailId(value!),
                                    hint: 'xyz@gmail.com',
                                    showLabel: true),
                              ),
                              Row(
                                children: [
                                  Flexible(
                                      flex: 1,
                                      child: TextInputField(
                                          label: 'Mobile:',
                                          controller: _phoneCode,
                                          enabled: false,
                                          showLabel: true)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                      flex: 6,
                                      child: TextInputField(
                                          label: '',
                                          controller: _phoneController,
                                          enabled: true,
                                          keyboardType: TextInputType.number,
                                          validator: (value) =>
                                              Validator.validatePhoneNumber(
                                                  value!),
                                          hint: '85XXXXXXX10',
                                          showLabel: true))
                                ],
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
                                      Validator.validatePasswordSignUp(value!),
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
                              GestureDetector(
                                onTap: () => FocusScope.of(context).unfocus(),
                                child: TextInputField(
                                  label: 'Confirm Password',
                                  controller: _confirmPasswordController,
                                  enabled: true,
                                  showLabel: true,
                                  obsecure: _confirmPasswordVisible,
                                  validator: (value) =>
                                      Validator.validateConfirmPasswor(
                                          value!, _passwordController),
                                  keyboardType: TextInputType.text,
                                  suffix: IconButton(
                                    icon: _confirmPasswordVisible
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
                                      _confirmPasswordToggle();
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(bottom: 10, top: 10),
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _registerClick();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          AppColors.primaryButtonColor,
                                      foregroundColor: Colors.white),
                                  child: const Text(
                                    'Create an account',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
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
                            const TextSpan(text: 'Registered?'),
                            WidgetSpan(
                                child: InkWell(
                              mouseCursor: SystemMouseCursors.click,
                              highlightColor: Colors.red.shade900,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()));
                              },
                              child: Text(
                                ' Log in',
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
      )),
    );
  }
}
