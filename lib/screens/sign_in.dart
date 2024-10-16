import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../app_router/route_constants.dart';
import '../components/rounded_button.dart';
import '../components/rounded_button2.dart';
import '../components/text_style.dart';
import '../input_form_field.dart';
import '../validators.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>(); // Declare _formKey here

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? _deviceId;
  bool passwordShow = true;

  // Future<void> getDeviceId() async {
  //   String? deviceId = await FirebaseServ.getFCMToken();
  //   setState(() {
  //     _deviceId = deviceId;
  //   });
  // }


  @override
  void initState() {
    super.initState();

  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final connectivity = ref.watch(connectivityStatusProviders);
    // print(connectivity.connectivityStatus);

    return Scaffold(
      backgroundColor: Colors.white,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: _formKey, // Assign the key to the Form widget
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const Text(
                    'Email',
                    style: AppTextStyle.smallTextTwo,
                  ),
                  SizedBox(height: 20.h),
                  InputFormField(
                    borderRadius: BorderRadius.circular(10),
                    fillColor: const Color(0xfffafafa),
                    textEditingController: emailController,
                    validator: Validators.isValidName,
                    hintTextStyle: AppTextStyle.textStyleOne(
                      const Color(0xffC4C5C4),
                      14,
                      FontWeight.w400,
                    ),
                    hintText: 'Enter your Email Address',
                    borderType: BorderType.none,
                  ),
                  SizedBox(height: 30.h),
                  const Text(
                    'Password',
                    style: AppTextStyle.smallTextTwo,
                  ),
                  SizedBox(height: 20.h),
                  InputFormField(
                    borderRadius: BorderRadius.circular(10),
                    fillColor: const Color(0xfffafafa),
                    password: EnabledPassword(),
                    obscuringCharacter: '*',
                    textEditingController: passwordController,
                    validator: Validators.isValidPassword,
                    hintTextStyle: AppTextStyle.textStyleOne(
                      const Color(0xffC4C5C4),
                      14,
                      FontWeight.w400,
                    ),
                    hintText: 'Enter Account Password',
                    borderType: BorderType.none,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // context.pushReplacement('/${Routers.forgetPass}');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Forget password pressed!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot Password ?',
                          style: TextStyle(
                            color: Color.fromRGBO(196, 196, 196, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        persistentFooterButtons: [
          Column(
            children: [
              RoundedButton2(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.go('/');
                  }
                },
                title: 'Sign In',
                textColor: const Color.fromRGBO(255, 255, 255, 1),
                colour: Color.fromRGBO(16, 13, 64, 1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account ?',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: Color(0xFF100D40),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go('/${Routes.signUp}');
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xFF100D40),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]);
  }

}
