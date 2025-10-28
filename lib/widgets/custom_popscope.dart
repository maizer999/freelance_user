import 'package:flutter/material.dart';

class MyPopScope extends StatefulWidget {
  final Widget child;

  const MyPopScope({required this.child, super.key});

  @override
  State<MyPopScope> createState() => _MyPopScopeState();
}

class _MyPopScopeState extends State<MyPopScope> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
