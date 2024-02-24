import 'package:flutter/material.dart';

import 'tab_page.dart';

class CallsPage extends TabPage {
  const CallsPage({required super.pageTitle, required super.badge, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(pageTitle));
  }
}
