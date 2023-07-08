import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snapsearch/constants/colors.dart';
import 'package:snapsearch/features/auth/screens/signupscreen.dart';
import 'package:snapsearch/features/auth/services/auth_services.dart';
import 'package:snapsearch/features/auth/widgets/textfield.dart';

class AuthScreen extends StatefulWidget {
  static const String routename = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final AuthService authService = AuthService();



Future<void> loginUser() async{

setState(() {
  isLoading = true;
});
 
//*login code
   authService.signInUser(
      context: context,
      email: emailcontroller.text,
      password: passwordcontroller.text,
    );

setState(() {
  isLoading = false;
});

}




bool isLoading = false;
TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller= TextEditingController();


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
                  height: 222.h,
                 
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/login.png"),)),
                ),
              ),
              SizedBox(
                height: 49.h,
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
                height: 18.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 250.w, right: 30.w),
                child: Text(
                  'Recover Password',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 14.sp,
                      fontFamily: 'HelveticaRegular'),
                ),
              ),
              SizedBox(
                height: 53.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.0.w),
                child: GestureDetector(
                  onTap: loginUser,
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
                            "Let's Sign in now",
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
                            builder: (context) => const SignUpScreen()));
                    // ? navigate to the sign up screen
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an account? ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff453E4E),
                            fontSize: 14.sp,
                            fontFamily: 'RobotoRegular'),
                      ),
                      Text(
                        'Create now',
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