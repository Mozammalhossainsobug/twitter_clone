import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/constants/constants.dart';
import 'package:twitter_clone/features/auth/view/signup_view.dart';
import 'package:twitter_clone/features/auth/widget/auth_field.dart';

import '../../../common/loading_page.dart';
import '../../../theme/pallete.dart';
import '../controller/auth_controller.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  static route() => MaterialPageRoute(
        builder: (context) => const LoginView(),
      );

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onlogin() {
    final res = ref.read(authControllerProvider.notifier).login(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    final isloading = ref.watch(authControllerProvider.notifier).state;
    return Scaffold(
      appBar: appbar,
      body: isloading? const Loader() : Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                // textField_1
                AuthField(controller: emailController, hintText: 'email'),
                const SizedBox(
                  height: 25,
                ),
                // textField_2
                AuthField(controller: passwordController, hintText: "password"),
                const SizedBox(
                  height: 40,
                ),
                // button
                Align(
                    alignment: Alignment.topRight,
                    child: RoundedSmallButton(
                      onTap: onlogin,
                      label: 'Done',
                      backgroundColor: Pallete.whiteColor,
                      textColor: Pallete.backgroundColor,
                    )),
                const SizedBox(
                  height: 40,
                ),
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
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              SignUpView.route(),
                            );
                          },
                      )
                    ]))
                // textSpan
              ],
            ),
          ),
        ),
      ),
    );
  }
}
