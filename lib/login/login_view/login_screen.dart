import 'package:color_kahar_project/login/login_controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final controller = Get.put(LoginController());
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  double deviceWidthPixels = 0;
  double screenDesignWidthPixels = 360;

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _emailController.dispose();
    dispose();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidthPixels = MediaQuery.of(context).size.width;
    return MaterialApp(
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
                height: getResponsiveSize(20),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: getResponsiveSize(69)),
                child: Center(
                  child: Text(
                    'Login with your mobile number or E-mail to continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xffAEAEAE),
                        fontSize: getResponsiveSize(15),
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              SizedBox(
                height: getResponsiveSize(20),
              ),
              GetBuilder<LoginController>(
                  id: 'login_options_key',
                  builder: (context) {
                    return Row(
                      children: [
                        SizedBox(
                          width: getResponsiveSize(15),
                        ),
                        Container(
                          height: getResponsiveSize(27),
                          width: getResponsiveSize(163),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: controller.userTypeId ==
                                          LoginController.mobileTypeId
                                      ? controller.activeColorLogin
                                      : controller.inActiveColorLogin),
                              onPressed: () {
                                controller.setLoginOptionType(
                                    LoginController.mobileTypeId);
                                // controller.updateTheColors(1);
                              },
                              child: const Text('Mobile Number')),
                        ),
                        SizedBox(
                          width: getResponsiveSize(3),
                        ),
                        Container(
                          height: getResponsiveSize(27),
                          width: getResponsiveSize(163),
                          child: ElevatedButton(
                              onPressed: () {
                                controller.setLoginOptionType(
                                    LoginController.emailTypeId);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: controller.userTypeId ==
                                          LoginController.emailTypeId
                                      ? controller.activeColorLogin
                                      : controller.inActiveColorLogin),
                              child: const Text(
                                'E-mail',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                        SizedBox(
                          width: getResponsiveSize(15),
                        ),
                      ],
                    );
                  }),
              GetBuilder<LoginController>(
                  id: 'TextField_options_key',
                  builder: (context) {
                    return controller.userTypeId == LoginController.emailTypeId
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getResponsiveSize(15),
                                vertical: getResponsiveSize(10)),
                            child: Form(
                                key: controller.emailFormKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.blue),
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      suffixIcon: controller.isEmailValid.value
                                          ? const Icon(Icons.check)
                                          : null),
                                  onChanged: (value) {
                                    controller.emailFormKey.currentState
                                        ?.validate();
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter the Email';
                                    } else if (!RegExp(
                                            r'^[_a-zA-z0-9+]+(\.[_a-zA-Z0-9-]+)*@+[a-zA-Z0-9-]+(\.[a-zA-Z0-9]+)*\.[a-zA-z\s]{2,}$')
                                        .hasMatch(value)) {
                                      return controller.isEmailValid.value
                                          ? null
                                          : 'Please enter a valid email';
                                    }
                                  },
                                )),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getResponsiveSize(15),
                                vertical: getResponsiveSize(10)),
                            child: Form(
                                key: controller.phoneNumberFormKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  style: const TextStyle(color: Colors.blue),
                                  controller: _phoneNumberController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    controller.phoneNumberFormKey.currentState
                                        ?.validate();
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
                                )),
                          );
                  }),
              SizedBox(
                height: getResponsiveSize(10),
              ),
              Container(
                // color: Colors.amber,
                height: getResponsiveSize(47),
                width: getResponsiveSize(329),
                child: ElevatedButton(
                  onPressed: () {
                    final phoneNumberFormIsValid = controller
                      ..phoneNumberFormKey.currentState;
                    final emailFormIsValid =
                        controller.emailFormKey.currentState;
                    print(phoneNumberFormIsValid);
                    print(emailFormIsValid);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFFA800),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: getResponsiveSize(20),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(
                                left: getResponsiveSize(20),
                                right: getResponsiveSize(10)),
                            child: Divider())),
                    Text(
                      "or",
                      style: TextStyle(
                          color: Color(0xff707070),
                          fontSize: getResponsiveSize(15),
                          fontWeight: FontWeight.normal),
                    ),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(
                                left: getResponsiveSize(10),
                                right: getResponsiveSize(20)),
                            child: Divider())),
                  ]),
              SizedBox(
                height: getResponsiveSize(20.0),
              ),
              Container(
                  alignment: Alignment.center,
                  height: getResponsiveSize(46.61),
                  width: getResponsiveSize(264.94),
                  child: ElevatedButton.icon(
                    icon: Image.asset('assetsImages/google icon.jpg'),
                    label: Center(
                      child: Text('Login with Google',
                          style: TextStyle(
                              color: const Color(0xffAEAEAE),
                              fontWeight: FontWeight.w500,
                              fontSize: getResponsiveSize(11))),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(
                            side: BorderSide(color: Color(0xffDBDBDB))),
                        backgroundColor: const Color(0xffFFFFFF)),
                  )),
              SizedBox(
                height: getResponsiveSize(10.0),
              ),
              Container(
                  alignment: Alignment.center,
                  height: getResponsiveSize(47),
                  width: getResponsiveSize(265),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Image.asset('assetsImages/facebook logo.png'),
                    label: Center(
                      child: Text(' Login with Facebook ',
                          style: TextStyle(
                              color: const Color(0xffFFFFFF),
                              fontWeight: FontWeight.w500,
                              fontSize: getResponsiveSize(11))),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: const Color(0xff137AF1)),
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
