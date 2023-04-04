import 'package:flutter/material.dart';

import 'screens/get_started.dart';
import 'screens/main_navigations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dating app',
      home:MainNavigations(),
    );
  }
}
