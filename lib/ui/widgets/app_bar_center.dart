import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final double padding;
  final List<Widget>? actions; // Making actions parameter optional

  const CustomAppBar({super.key,
    required this.title,
    required this.backgroundColor,
    required this.padding,
    this.actions, // Making actions parameter optional
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      iconTheme: theme.iconTheme,
      backgroundColor: backgroundColor,
      actions: actions,
      title: Center(
        child: Padding(
          padding: EdgeInsets.only(right: padding),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}