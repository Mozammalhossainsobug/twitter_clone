import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';
import '../../../constants/constants.dart';
import 'package:twitter_clone/common/common.dart';

import '../../../theme/pallete.dart';
import '../widget/auth_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                // textField_1
                AuthField(controller: emailController, hintText: 'email'),
                const SizedBox(height: 25,),
                // textField_2
                AuthField(controller: passwordController, hintText: "password"),
                const SizedBox(height: 40,),
                // button
                Align(
                    alignment: Alignment.topRight,
                    child: RoundedSmallButton(onTap: () {},
                      label: 'Done',
                      backgroundColor: Pallete.whiteColor,
                      textColor: Pallete.backgroundColor,)),
                const SizedBox(height: 40,),
                RichText(
                    text: TextSpan(
                        text: "Already have an account?",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: ' LogIn',
                            style: const TextStyle(
                              color: Pallete.blueColor,
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => LoginView(),
                                ),
                                );
                              },
                          )
                        ]
                    ))
                // textSpan
              ],
            ),
          ),
        ),
      ),
    );
  }
}


