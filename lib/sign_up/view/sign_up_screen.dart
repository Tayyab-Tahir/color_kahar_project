import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _landLineNumberController =
      TextEditingController();
  final firstNameKey = GlobalKey<FormState>();
  final lastNameKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();
  final phoneNumberFormKey = GlobalKey<FormState>();
  final landLineNumberFormKey = GlobalKey<FormState>();
  double deviceWidthPixels = 0;
  double screenDesignWidthPixels = 360;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _landLineNumberController.dispose();
    dispose();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidthPixels = MediaQuery.of(context).size.width;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                fit: StackFit.passthrough,
                children: [
                  Container(
                    height: getResponsiveSize(170),
                    width: getResponsiveSize(800),
                    // color: Colors.blueAccent,
                    child: Image.asset(
                      'assetsImages/Yellow Color.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: getResponsiveSize(136.23),
                    height: getResponsiveSize(127.09),
                    margin: EdgeInsets.fromLTRB(getResponsiveSize(110),
                        getResponsiveSize(100), getResponsiveSize(110), 0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.center,
                        matchTextDirection: true,
                        fit: BoxFit.cover,
                        image: AssetImage("assetsImages/ck logo.png"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getResponsiveSize(60),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: getResponsiveSize(30),
                  ),
                  Flexible(
                    child: Form(
                      autovalidateMode: AutovalidateMode.disabled,
                      key: firstNameKey,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.blue),
                        controller: _firstNameController,
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          border: OutlineInputBorder(),
                          hintText: 'First Name   ',
                        ),
                        onChanged: (value) {
                          firstNameKey.currentState?.validate();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter First Name';
                          } else if (!RegExp(r'^[a-zA-Z\s]*$')
                              .hasMatch(value)) {
                            return 'Enter a valid Name';
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getResponsiveSize(20),
                  ),
                  Flexible(
                    child: Form(
                      autovalidateMode: AutovalidateMode.disabled,
                      key: lastNameKey,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.blue),
                        controller: _lastNameController,
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                          border: OutlineInputBorder(),
                          hintText: 'Last Name  ',
                        ),
                        onChanged: (value) {
                          lastNameKey.currentState?.validate();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Last Name';
                          } else if (!RegExp(r'^[a-zA-Z\s]*$')
                              .hasMatch(value)) {
                            return 'Enter a valid name';
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getResponsiveSize(30),
                  ),
                ],
              ),
              SizedBox(
                height: getResponsiveSize(10),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getResponsiveSize(30),
                    vertical: getResponsiveSize(15)),
                child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: phoneNumberFormKey,
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(color: Colors.blue),
                    controller: _phoneNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                      hintText: 'Phone Number',
                    ),
                    onChanged: (value) {
                      phoneNumberFormKey.currentState?.validate();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter the Phone Number';
                      } else if (!RegExp(
                              r'^((\+923|923|03)(([0-4]{1}[0-9]{1})|(55)|(64))[0-9]{7})$')
                          .hasMatch(value)) {
                        return 'Enter a valid Phone Number';
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getResponsiveSize(30),
                    vertical: getResponsiveSize(10)),
                child: Form(
                    key: emailFormKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.blue),
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                      onChanged: (value) {
                        emailFormKey.currentState?.validate();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter the Email';
                        } else if (!RegExp(
                                r'^[_a-zA-z0-9\+]+(\.[_a-zA-Z0-9-]+)*@+[a-zA-Z0-9-]+(\.[a-zA-Z0-9]+)*\.[a-zA-z\s]{2,}$')
                            .hasMatch(value)) {
                          return 'Enter a valid Email';
                        }
                      },
                    )),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getResponsiveSize(30),
                    vertical: getResponsiveSize(10)),
                child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: landLineNumberFormKey,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.blue),
                    controller: _landLineNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Landline Number',
                      border: OutlineInputBorder(),
                      hintText: 'Landline Number',
                    ),
                    onChanged: (value) {
                      landLineNumberFormKey.currentState?.validate();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter the Landline Number';
                      } else if (!RegExp(
                              r'^(03(([0-4]{1}[0-9]{1})|(55)|(64))[0-9]{7})|^([0]{1})((21[0-9]{8}|42[0-9]{8}|51[0-9]{8}|61[0-9]{7}|91[0-9]{7}))$')
                          .hasMatch(value)) {
                        return 'Enter a valid Landline Number';
                      }
                    },
                  ),
                ),
              ),
              const Center(
                child: SizedBox(
                  height: 45.0,
                ),
              ),
              Container(

                  // color: Colors.amber,
                  height: getResponsiveSize(47),
                  width: getResponsiveSize(330),
                  padding: EdgeInsets.fromLTRB(
                      getResponsiveSize(20), 0, getResponsiveSize(20), 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      final firstNameForm = firstNameKey.currentState;
                      final lastNameForm = lastNameKey.currentState;
                      final FormState? phoneNumberForm =
                          phoneNumberFormKey.currentState;
                      final emailForm = emailFormKey.currentState;
                      final landlineNumberForm =
                          landLineNumberFormKey.currentState;
                      if (firstNameForm!.validate()) {
                        print('if condition of the first name \n');
                        print(_firstNameController);
                      } else {
                        print('else condition of first name\n');
                        print(_firstNameController);
                      }

                      if (lastNameForm!.validate()) {
                        print('if condition of the last name\n ');
                        print(_lastNameController);
                      } else {
                        print("else condition of last name \n");
                        print(_lastNameController);
                      }

                      if (phoneNumberForm!.validate()) {
                        print('if condition of phone number\n');
                        print(_phoneNumberController);
                      } else {
                        print("else condition of the phone number \n");
                        print(_phoneNumberController);
                      }

                      if (emailForm!.validate()) {
                        print('if condition of the email\n');
                        print(_emailController);
                      } else {
                        print("else condition of the email  \n");
                        print(_emailController);
                      }

                      if (landlineNumberForm!.validate()) {
                        print('if condition of landline number\n ');
                        print(_landLineNumberController);
                      } else {
                        print("else condition of the landline Number\n ");
                        print(_landLineNumberController);
                      }
                      _firstNameController.text = '';
                      _lastNameController.text = '';
                      _phoneNumberController.text = '';
                      _emailController.text = '';
                      _landLineNumberController.text = '';
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }

  double getResponsiveSize(double pixels) {
    return (pixels / screenDesignWidthPixels) * deviceWidthPixels;
  }
}
