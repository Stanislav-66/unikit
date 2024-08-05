
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unikit/generated/l10n.dart';

import 'package:user_reposytory/user_repository.dart';

import '../auth_screen/bloc/sign_in/sign_in_bloc.dart';


class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  String name = 'UserName';
  String email = 'ghost@example.com';
  String password = '********';
  late TextEditingController _controllerName;
  late TextEditingController _controllerEmail;
  late UserL userDefault;

  @override
  void initState() {
    super.initState();
    userDefault = UserL(IdUser: "", Email: email, Name: name);
    _controllerName = TextEditingController(text: userDefault.Name);
    _controllerEmail = TextEditingController(text: userDefault.Email);
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        if (state is SignInSuccess) {
          userDefault = state.user;
          _controllerName.text = userDefault.Name;
          _controllerEmail.text = userDefault.Email;
        }

        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (state is SignInProcess) ...[
                      const CircularProgressIndicator(),
                    ] else ...[
                      const Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('assets/images/url/user.png'), // Placeholder image
                        ),
                      ),
                      TextField(
                        controller: _controllerName,
                        decoration: InputDecoration(labelText: S.of(context).name),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          userDefault = userDefault.copyWith(Name: _controllerName.text);
                          context.read<SignInBloc>().add(ChangeNameEvent(userDefault));
                        },
                        child: Text(S.of(context).changeName),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _controllerEmail,
                        decoration: InputDecoration(labelText: S.of(context).email),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          _showPasswordDialog(context);
                        },
                        child: Text(S.of(context).changeEmail),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(S.of(context).submit),
                                content: Text(S.of(context).exitTrueF),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(S.of(context).cancel),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.read<SignInBloc>().add(ExitUsers());
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(S.of(context).submit_button),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(S.of(context).userExit),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showPasswordDialog(BuildContext context) {
    final TextEditingController controllerPassword = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).enterPassword),
          content: TextField(
            controller: controllerPassword,
            decoration: InputDecoration(labelText: S.of(context).password),
            obscureText: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).cancel),
            ),
            ElevatedButton(
              onPressed: () {
                final newEmail = _controllerEmail.text;
                final password = controllerPassword.text;
                context.read<SignInBloc>().add(ChangeEmail(newEmail: newEmail, password: password));
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).submit),
            ),
          ],
        );
      },
    );
  }
}
