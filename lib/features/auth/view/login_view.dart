import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_one/common/navigation.dart';
import 'package:project_one/common/rounded_small_button.dart';
import 'package:project_one/constants/constants.dart';
import 'package:project_one/features/auth/controller/auth_controller.dart';
import 'package:project_one/features/auth/view/signup_view.dart';
import 'package:project_one/features/auth/widgets/auth_field.dart';
import 'package:project_one/theme/pallete.dart';

class LoginView extends ConsumerStatefulWidget {
  // static route() => MaterialPageRoute(
  //       builder: (context) => const LoginView(),
  //     );
  static route() => CustomRouter(destination: const LoginView()).route();

  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => __LoginViewState();
}

class __LoginViewState extends ConsumerState<LoginView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onLogin() {
    final res = ref.read(authControllerProvider.notifier).login(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    const cerculler = UIConstants.cerculer;
    return Scaffold(
      appBar: appbar,
      body: Center(
        child: SingleChildScrollView(
          child: isLoading
              ? cerculler()
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        AuthField(
                          controller: emailController,
                          hintText: "Email",
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        AuthField(
                          controller: passwordController,
                          hintText: "Password",
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: RoundedSmallButton(
                            ontap: onLogin,
                            label: 'Done',
                            backgroundColor: Pallete.whiteColor,
                            textColor: Pallete.backgroundColor,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Dont't have an account?",
                              style: const TextStyle(
                                color: Pallete.whiteColor,
                                fontSize: 15,
                              ),
                              children: [
                                TextSpan(
                                  text: ' Sign up',
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
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
