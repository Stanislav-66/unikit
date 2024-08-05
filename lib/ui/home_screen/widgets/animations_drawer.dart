import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unikit/app/bloc.dart';
import 'package:user_reposytory/user_repository.dart';

class AnimatedDrawer extends StatelessWidget {
  final List<Widget> drawerItems;

  const AnimatedDrawer({super.key, required this.drawerItems});


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    UserL? user;
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            child: DrawerHeader(
              child: BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if(state is SignInSuccess)
                  {
                    user = state.user;
                  }
                  return Column(
                    children: [
                      const Image(
                        image: AssetImage('assets/images/url/user.png'),
                        width: 90,
                        height: 90,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            user?.Email ?? 'ghost@gmail.com', //user.email ?? "user Email",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            user?.Name ?? "UserName", //user.email ?? "user Email",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: drawerItems,
            ),
          ),
        ],
      ),
    );
  }

  static Widget createDrawerItem(BuildContext context, IconData icon,
      String text, Function onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text, style: Theme
          .of(context)
          .textTheme
          .titleMedium),
      onTap: () {
        onTap();
        AutoRouter.of(context).popForced(context);
      },
    );
  }
}
