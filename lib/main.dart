import 'package:flutter/material.dart';
import 'views/home_view.dart';

void main() {
  runApp(const TokoGadgetApp());
}

class TokoGadgetApp extends StatelessWidget {
  const TokoGadgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Gadget Kak Fandi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}