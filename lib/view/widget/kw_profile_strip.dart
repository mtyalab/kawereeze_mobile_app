import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class KwProfileStrip extends StatelessWidget {
  const KwProfileStrip(
      {Key? key,
      required this.profileName,
      required this.phoneNumber,
      required this.email,
      required this.placeholder})
      : super(key: key);

  final String profileName;
  final String phoneNumber;
  final String email;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const ShapeBorderClipper(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(size4)))),
      child: Container(
        padding: const EdgeInsets.only(top: size8, bottom: size8),
        decoration: const BoxDecoration(
            color: Colors.white,
        ),
        child: ListTile(
          leading: CircleAvatar(
              backgroundImage: AssetImage(
            placeholder,
          )),
          trailing: const Icon(Icons.chevron_right_outlined),
          title: Text(
            profileName,
            style: const TextStyle(
                fontSize: size15, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                phoneNumber,
                style: const TextStyle(
                    fontSize: size11, fontWeight: FontWeight.bold),
              ),
              Text(
                email,
                style: const TextStyle(
                    fontSize: size11, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
