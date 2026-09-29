import 'package:flutter/material.dart';

void main() {
  runApp(KahrabaiApp());
}

class KahrabaiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'كهربائي برو',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('كهربائي برو ⚡')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.electrical_services, size: 100, color: Colors.orange),
            SizedBox(height: 20),
            Text('أهلا بك في كهربائي برو', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('التطبيق شغال تمام'),
          ],
        ),
      ),
    );
  }
}
