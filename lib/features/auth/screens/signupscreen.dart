import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snapsearch/constants/colors.dart';
import 'package:snapsearch/features/auth/screens/authscreen.dart';
import 'package:snapsearch/features/auth/services/auth_services.dart';
import 'package:snapsearch/features/auth/widgets/textfield.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;
TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller= TextEditingController();
TextEditingController namecontroller= TextEditingController();
  final AuthService authService = AuthService();
 
 Future<void> signupUser() async{
  authService.signup(
      context: context,
      email: emailcontroller.text,
      password: passwordcontroller.text,
      name: namecontroller.text
    );
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 32.0.h, bottom: 31.h),
                child: Center(
                  child: Text(
                    "Hello!",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 23.sp,
                        fontFamily: 'RobotoRegular'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 0.w),
                child: Container(
                  height: 300.h,
                 
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/create.png"),)),
                ),
              ),
              SizedBox(
                height: 0.h,
              ),
                   TextFieldContainer(
                hinttext: 'Name',
                controller: namecontroller,
                textInputType: TextInputType.emailAddress,
              ),
               SizedBox(
                height: 20.h,
              ),
              TextFieldContainer(
                hinttext: 'Email Address',
                controller: emailcontroller,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFieldContainer(
                hinttext: 'Password',
                controller: passwordcontroller,
                isPass: true,
                textInputType: TextInputType.text,
              ),
      
            
              SizedBox(
                height: 53.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.0.w),
                child: GestureDetector(
                  onTap: signupUser,
                  child: Container(
                    alignment: Alignment.center,
                    height: 58.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Let's Sign up now",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontFamily: 'ArialBold'),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 48.h,
              ),
           
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthScreen()));
                    // ? navigate to the sign up screen
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff453E4E),
                            fontSize: 14.sp,
                            fontFamily: 'RobotoRegular'),
                      ),
                      Text(
                        'Sign in',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'HelveticaRegular'),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
 
 
  }
}