import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/constants/constants.dart';
import 'package:twitter_clone/features/auth/widget/auth_field.dart';

import '../../../theme/pallete.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void dispose()
  {
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
                    child: RoundedSmallButton(onTap: (){}, label: 'Done', backgroundColor: Pallete.whiteColor, textColor: Pallete.backgroundColor,)),
                const SizedBox(height: 40,),
                RichText(
                    text: TextSpan(
                      text: "Don't have any account?",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      children: [
                        TextSpan(
                          text: ' SignUp',
                          style: const TextStyle(
                            color: Pallete.blueColor,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = (){

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
