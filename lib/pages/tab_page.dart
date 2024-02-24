import 'package:flutter/material.dart';

abstract class TabPage extends StatelessWidget {
  final int badge;
  final String pageTitle;

  const TabPage({
    required this.pageTitle,
    required this.badge,
    super.key,
  });
}
