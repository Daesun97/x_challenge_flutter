import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:x_challenge/constants/gaps.dart';
import 'package:x_challenge/constants/sizes.dart';
import 'package:x_challenge/features/authentication/confirmation_screen.dart';
import 'package:x_challenge/features/widget/next_button.dart';

class CreateAcoountScreen extends StatefulWidget {
  const CreateAcoountScreen({super.key});

  @override
  State<CreateAcoountScreen> createState() => _CreateAcoountScreenState();
}

class _CreateAcoountScreenState extends State<CreateAcoountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _birthdaycontroller = TextEditingController();
  DateTime initialDate = DateTime.now();
  bool _nameValid = false;
  // final bool _nameValid = false;

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        // print(formData);
      }
    }
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ConfirmationScreen()));
  }

  bool _isEmailValid() {
    if (formData['email'] == null) return false;
    // perform valid
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(formData['email'].toString())) {
      return false;
    }
    return true;
  }

  void _validateName(String? value) {
    if (value != null) {
      setState(() {
        _nameValid = true;
      });
    }
  }

  void _nameSave(name) {
    setState(() {
      formData['name'] = name;
    });
  }

  void _emailSave(email) {
    setState(() {
      formData['email'] = email;
    });
    print(formData);
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdaycontroller.value = TextEditingValue(text: textDate);
  }

  Map<String, dynamic> formData = {};

  @override
  void dispose() {
    _emailcontroller.dispose();
    _namecontroller.dispose();
    _birthdaycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const FaIcon(
          FontAwesomeIcons.xTwitter,
          size: Sizes.size44,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v32,
            const Text(
              '계정 생성',
              style: TextStyle(
                fontSize: Sizes.size32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v28,
                  //이름
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _namecontroller,
                          decoration: InputDecoration(
                            hintText: '이름',
                            suffixIcon: _nameValid
                                ? const FaIcon(
                                    FontAwesomeIcons.circleCheck,
                                    color: Colors.green,
                                  )
                                : null,
                          ),
                          onChanged: (value) {
                            _validateName(value);
                            _formKey.currentState?.validate();
                          },
                          //유효성 검사
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '이름을 적어주세요';
                            }

                            return null;
                          },
                          onSaved: (newValue) {
                            if (newValue != null) {
                              formData['name'] = newValue;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Gaps.v16,
                  //이메일
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _emailcontroller,
                          decoration: InputDecoration(
                            hintText: '이메일',
                            suffixIcon: _isEmailValid()
                                ? const FaIcon(
                                    FontAwesomeIcons.circleCheck,
                                    color: Colors.green,
                                  )
                                : null,
                          ),
                          onChanged: (value) => _emailSave(value),
                          //유효성 검사
                          validator: (value) {
                            // if (value == null || value.isEmpty) {
                            //   return '이메일을 적어주세요';
                            // }

                            return null;
                          },
                          onSaved: (newValue) {
                            if (newValue != null) {
                              formData['email'] = newValue;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Gaps.v16,
                  //생일
                  TextFormField(
                    controller: _birthdaycontroller,
                    enabled: false,
                    decoration: const InputDecoration(hintText: '생일'),
                    validator: (value) {
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['birthday'] = newValue;
                      }
                    },
                  ),
                  GestureDetector(
                    onTap: _onSubmitTap,
                    child: NextButton(
                      text: '다음',
                      disabled: !_nameValid,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 200,
        child: CupertinoDatePicker(
          onDateTimeChanged: _setTextFieldDate,
          maximumDate: initialDate,
          mode: CupertinoDatePickerMode.date,
          initialDateTime: initialDate,
        ),
      ),
    );
  }
}
