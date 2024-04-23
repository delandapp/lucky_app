import 'package:flutter/material.dart';

class MyJarak extends StatelessWidget {
  const MyJarak({
    super.key,
    required this.flex
  });
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: SizedBox(),flex: flex,);
  }
}
