import 'package:flutter/material.dart';
import 'package:startfirstdemo/AppBarDisplay.dart';
import 'package:startfirstdemo/AppTheme.dart';
import 'package:startfirstdemo/MyData.dart';
import 'package:startfirstdemo/bottomTextField.dart';
import 'package:startfirstdemo/list.dart';
import 'package:provider/provider.dart';
import 'Theme.dart';

void main() {
  runApp(const MyApp());
}

AppTheme appTheme = AppTheme();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    appTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDO Demo',
      themeMode: appTheme.themeMode,
      darkTheme: darkTheme,
      theme: lightTheme,
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
            create: (_) => MyData()
              ..getData()), //when app start it will fetch defaul db value
      ], child: const HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDisplay(),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: LIST()),
      bottomNavigationBar: bottomTextField(),
    );
  }
}
