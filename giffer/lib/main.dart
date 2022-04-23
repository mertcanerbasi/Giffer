import 'package:flutter/material.dart';
import 'package:giffer/services/save_service.dart';

import 'pages/home_page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SavetoDevice().saveUrls("");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}
