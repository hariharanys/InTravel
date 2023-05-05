import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intravel/common/textInputField.dart';
import 'package:image_picker/image_picker.dart';
import '../common/validator.dart';
import '../theme/app_colors.dart';
import '../theme/text_style.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({super.key});

  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
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

  _imagePicker() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    print(pickedFile);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _fullNameController;
    _emailController;
    _phoneController;
    _phoneCode;
    _passwordController;
    _confirmPasswordController;
  }

  _updateClick() {
    if (formGlobalKey.currentState != null) {
      if (formGlobalKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Updated Successfully',
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
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor.withOpacity(.1),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              weight: 700,
            )),
        centerTitle: true,
        title: const Text('Personal Infromation', style: headingStyle),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  _imagePicker();
                },
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/zoro.jpg',
                              ),
                            )),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.6),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white.withOpacity(.8),
                          size: 30,
                        )),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
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
                                        Validator.validatePhoneNumber(value!),
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
                          margin: const EdgeInsets.only(bottom: 10, top: 10),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () {
                              _updateClick();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryButtonColor,
                                foregroundColor: Colors.white),
                            child: const Text(
                              'Update',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
