import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intravel/view/login.dart';

import '../common/textInputField.dart';
import '../common/validator.dart';
import '../theme/app_colors.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({super.key});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  void _onClick() {
    if (formGlobalKey.currentState != null) {
      if (formGlobalKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Sent Successfully',
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
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
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Recover Password',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 28),
                      ),
                    ),
                    const Text(
                      'Enter the email you provided during registration - we will send you a link to resolve your password',
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
                            Container(
                              margin:
                                  const EdgeInsets.only(bottom: 10, top: 10),
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () {
                                  _onClick();
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        AppColors.primaryButtonColor,
                                    foregroundColor: Colors.white),
                                child: const Text(
                                  'Send',
                                  style: TextStyle(fontWeight: FontWeight.w700),
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
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 40),
                  width: MediaQuery.of(context).size.width,
                  child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(children: [
                        const TextSpan(text: 'I remembered my password?'),
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
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
