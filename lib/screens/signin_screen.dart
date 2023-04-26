import 'package:flutter/material.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/api_Call/apicall.dart';
import 'package:task/screens/home_Screen.dart';
import 'package:task/screens/signup_screen.dart';
import 'package:task/widgets/backgroud1.dart';
import 'package:task/widgets/customeTextwidget.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _deviceId;
  final _mobileDeviceIdentifierPlugin = MobileDeviceIdentifier();
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getdevice() async {
    _deviceId = await MobileDeviceIdentifier().getDeviceId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background1(
        auth: "Sign Up",
        subitle: "Don't have an account?",
        title: "Sign In ",
        ontap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignupScreen()));
        },
        child: SizedBox(
          child: Column(
            children: [
              const SizedBox(
                child: Text(
                  "Welcome!",
                  style: TextStyle(
                      color: Color(0xff434343),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                child: Text(
                  "Let's sign In to begin...",
                  style: TextStyle(
                    color: Color(0xff434343),
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextFieldWIdget(
                          type: TextInputType.phone,
                          isvisisble: false,
                          title: 'Mobile No.',
                          controller: phoneController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Mobile Number';
                            }
                            if (value.length != 10) {
                              return "Enter Valid Number";
                            }
                            return null;
                          },
                          hintText: 'e.g 9090990'),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFieldWIdget(
                          type: TextInputType.text,
                          isvisisble: true,
                          title: 'Password',
                          controller: passwordcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Password';
                            }
                            if (value.length < 5) {
                              return "Password Should be grater then 4";
                            }
                            return null;
                          },
                          hintText: ''),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                              color: const Color(0xff6237A0),
                              borderRadius: BorderRadius.circular(30)),
                          child: const Text("Continue to Sign In",
                              style: TextStyle(
                                  color: Color(0xffCFCFCF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center),
                        ),
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            login();
                          }

                          // print(id);
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Forgot Password?",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    final prefs = await SharedPreferences.getInstance();
    var res = await APICall().login(phoneController.text.toString(),
        passwordcontroller.text.toString(), _deviceId.toString());
    print(res);
    if (res["statuscode"] == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      prefs.setBool("islogin", true);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Something went wrong try again ")));
    }
  }
}
