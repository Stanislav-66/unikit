import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:unikit/generated/l10n.dart';
import 'package:unikit/ui/auth_screen/widgets/widgets.dart';
import 'package:user_reposytory/user_repository.dart';
import '../../app/bloc.dart';
import '../theme/theme_app.dart';
import '../theme/theme_provider.dart';


@RoutePage()
class SignUpScreen extends StatefulWidget implements AutoRouteWrapper {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(
        userRepository: context.read<AuthBloc>().userRepository,
      ),
      child: this,
    );
  }
}

class _SignUpScreenState extends State<SignUpScreen> with TickerProviderStateMixin {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool obscurePassword = true;
  bool showButton = false;
  bool signUpRequired = false;
  int timer = 5;
  Timer? _timer;
  String mes = "";

  Map<String, bool> passwordCriteria = {
    'containsUpperCase': false,
    'containsLowerCase': false,
    'containsNumber': false,
    'containsSpecialChar': false,
    'contains8Length': false,
    'containsverification' : false
  };


  void startTimer() {
    setState(() {
      timer = 5;
      showButton = false;
      mes = "Отправить ссылку для подтверждения почты можно через: $timer";
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (this.timer > 0) {
        setState(() {
          this.timer--;
          mes = "Отправить ссылку можно через: ${this.timer}";
        });
      } else {
        _timer?.cancel();
        setState(() {
          showButton = true;
          mes = "Отправить ссылку для подтверждения почты";
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = Provider.of<NotifierProviders>(context);
    return BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            setState(() {
              signUpRequired = false;
              showButton = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:Center(child: Text(S.of(context).registrationSuccessful),),
                duration: const Duration(seconds: 2),
              ),
            );

          } else if (state is SignUpProcess) {
            setState(() {
              signUpRequired = true;
            });
          }
          else if (state is SignUpFailure) {
            return;
          }
        },
        child: Scaffold(
          backgroundColor: theme.colorScheme.background,
          
          body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(provider.themeData == ThemesApp.lightTheme()
                                ? "assets/images/logo/logo_unikit.png"
                                : "assets/images/logo/logo_unikit_dark.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: AuthTextField(
                          controller: emailController,
                          hintText: S.of(context).email,
                          obscuredText: false,
                          type: TextInputType.emailAddress,
                          preffixIcon: const Icon(CupertinoIcons.mail_solid, color: Colors.grey),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return S.of(context).emptyField;
                            } else if (!RegExp(
                                r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$')
                                .hasMatch(val)) {
                              return S.of(context).validEmail;
                            }
                            return null;
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: AuthTextField(
                          controller: passwordController,
                          hintText: S.of(context).password,
                          obscuredText: obscurePassword,
                          type: TextInputType.visiblePassword,
                          preffixIcon: const Icon(CupertinoIcons.lock_fill, color: Colors.grey),
                          onChanged: (val) {
                            if (val!.contains(RegExp(r'[A-Z]'))) {
                              setState(() {
                                passwordCriteria['containsUpperCase'] = true;
                              });
                            } else {
                              setState(() {
                                passwordCriteria['containsUpperCase'] = false;
                              });
                            }
                            if (val.contains(RegExp(r'[a-z]'))) {
                              setState(() {
                                passwordCriteria['containsLowerCase'] = true;
                              });
                            } else {
                              setState(() {
                                passwordCriteria['containsLowerCase'] = false;
                              });
                            }
                            if (val.contains(RegExp(r'[0-9]'))) {
                              setState(() {
                                passwordCriteria['containsNumber'] = true;
                              });
                            } else {
                              setState(() {
                                passwordCriteria['containsNumber'] = false;
                              });
                            }
                            if (val.contains(RegExp(
                                r'^(?=.*?[!@#$&*~`)%\-(_+=;:,.<>/?"[{\]}|^])'))) {
                              setState(() {
                                passwordCriteria['containsSpecialChar'] = true;
                              });
                            } else {
                              setState(() {
                                passwordCriteria['containsSpecialChar'] = false;
                              });
                            }
                            if (val.length >= 8) {
                              setState(() {
                                passwordCriteria['contains8Length'] = true;
                              });
                            } else {
                              setState(() {
                                passwordCriteria['contains8Length'] = false;
                              });
                            }
                            return null;
                          },
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                                if (obscurePassword) {
                                  iconPassword = CupertinoIcons.eye_fill;
                                } else {
                                  iconPassword = CupertinoIcons.eye_slash_fill;
                                }
                              });
                            },
                            icon: Icon(iconPassword, color: Colors.grey),
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return S.of(context).emptyField;
                            } else
                            if (passwordCriteria['contains8Length'] == false) {
                              return S.of(context).password8;
                            } else
                            if (passwordCriteria['containsNumber'] == false) {
                              return S.of(context).passwordNumber;
                            } else if (passwordCriteria['containsUpperCase'] ==
                                false ||
                                passwordCriteria['containsLowerCase'] ==
                                    false) {
                              return S.of(context).passwordUpperLower;
                            } else
                            if (passwordCriteria['containsSpecialChar'] ==
                                false) {
                              return S.of(context).specialChar;
                            }
                            return null;
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    !signUpRequired
                        ? SizedBox(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 16),
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 3,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              UserL myUser = UserL.empty;
                              myUser = myUser.copyWith(
                                Email: emailController.text,
                              );
                              setState(() {
                                context.read<SignUpBloc>().add(
                                  SignUpRequired(
                                    myUser,
                                    passwordController.text,
                                  ),
                                );
                                mes = "Отправить ссылку для подтверждения почты";
                                showButton = true;
                              });
                            }
                          },
                          child: Text(S.of(context).signUp, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),),
                        ))
                        : const CircularProgressIndicator(),
                    showButton ?
                    TextButton(
                      onPressed: () {
                        startTimer();
                        context.read<SignUpBloc>().add(ResendEmailVerification());
                        },
                      child: Text(mes, style: theme.textTheme.bodyMedium ), )
                        : SizedBox(height: 20, child: Text(mes),),
                  ],
                ),
              )),
        ),
    );
  }
}