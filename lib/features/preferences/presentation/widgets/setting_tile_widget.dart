import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SettingTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      subtitle: Text(subtitle,
          style: const TextStyle(fontSize: 16, color: Colors.grey)),
      trailing: const Icon(
        Icons.edit_outlined,
        color: Colors.black,
      ),
      onTap: onTap,
    );
  }
}
