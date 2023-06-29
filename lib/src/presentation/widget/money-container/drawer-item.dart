import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final Widget leading;
  final void Function()? onTap;
  final bool showTrailing;

  const DrawerItem(
      {super.key,
      required this.title,
      required this.leading,
      required this.onTap,
      this.showTrailing = true});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: const Color(0xFF2743FB),
      leading: leading,
      trailing: showTrailing
          ? const Icon(
              Icons.arrow_forward_ios_sharp,
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Color(0xFF2743FB)),
      ),
      onTap: onTap,
    );
  }
}
