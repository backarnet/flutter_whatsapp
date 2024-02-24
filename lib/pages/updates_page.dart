import 'package:flutter/material.dart';

import 'tab_page.dart';

class UpdatesPage extends TabPage {
  const UpdatesPage(
      {required super.pageTitle, required super.badge, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(pageTitle));
  }
}
