import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:unikit/generated/l10n.dart';
import 'package:unikit/ui/auth_screen/bloc/sign_in/sign_in_bloc.dart';
import 'package:unikit/ui/theme/theme_app.dart';
import 'package:unikit/ui/theme/theme_provider.dart';
import '../../app/bloc.dart';
import 'widgets/widgets.dart';


@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();

}

class _SignInScreenState extends State<SignInScreen> with TickerProviderStateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _key = GlobalKey<FormState>();
  bool signIn = false;
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool obscurePassword = true;
  String? _errorMsg;

  String? Function(String?, bool) valLogin = CustomValidator.valLogin;
  String? Function(String?, bool) valPassword = CustomValidator.valPassword;

  String? validatePassword(String? value) {
    return valPassword(value, signIn);
  }
  String? validateLogin(String? value) {
    return valLogin(value, signIn);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotifierProviders>(context);
    final theme = Theme.of(context);
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          setState(() {
            signIn = false;
            _errorMsg = state.message;
          });
        }
        if (state is ResetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).messageWarningEmail)),
          );
        } else if (state is ResetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${S.of(context).errorSendLetter}${state.message}')),
          );
        }
      },
      child: Scaffold(
        body: Form(
          key: _key,
          child: Scrollbar(
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
                  AuthTextField(
                    controller: emailController,
                    hintText: S.of(context).email,
                    obscuredText: false,
                    type: TextInputType.emailAddress,
                    preffixIcon: const Icon(CupertinoIcons.mail_solid, color: Colors.grey),
                    validator: validateLogin,
                  ),
                  const SizedBox(height: 20),
                  AuthTextField(
                    controller: passwordController,
                    hintText: S.of(context).password,
                    obscuredText: obscurePassword,
                    type: TextInputType.visiblePassword,
                    preffixIcon: const Icon(CupertinoIcons.lock_fill, color: Colors.grey),
                    errMsg: _errorMsg,
                    validator: validatePassword,
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
                      icon: Icon(
                        iconPassword,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      S.of(context).altsign,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: provider.themeData == ThemesApp.lightTheme()
                            ? theme.colorScheme.primary
                            : Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/url/yandex.png', width: 50, height: 50),
                        onPressed: () {
                          // context.read<SignInBloc>().add(YandexSignInRequired());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  !signIn
                      ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                    ),
                    onPressed: () {
                      if (_key.currentState?.validate() ?? false) {
                        setState(() {
                          signIn = true;
                        });
                        context.read<SignInBloc>().add(SignInRequired(
                          emailController.text,
                          passwordController.text,
                        ));
                      }
                    },
                    child: Text(
                      S.of(context).signIn,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                    ),
                  )
                      : const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      context.read<SignInBloc>().add(ResetPasswordRequired(email: emailController.text));
                    },
                    child: Text(
                      S.of(context).forgot,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: provider.themeData == ThemesApp.lightTheme()
                            ? theme.colorScheme.primary
                            : Colors.white,
                      ),
                    ),
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



