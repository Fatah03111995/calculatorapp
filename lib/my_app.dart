import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[200],
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(39, 39, 39, 1),
            title: Text('Calculator App',
                style: TextStyle(
                    color: Colors.lightBlue[200],
                    fontSize: 35,
                    fontFamily: 'Poppins'))),
        body: Column(
          children: [
            const SizedBox(height: 20),
            //---- DISPLAY EXPRESSION VALUE
            Container(
                padding: const EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                height: 90,
                width: double.infinity,
                color: Colors.white60,
                child: Text(
                  '0',
                  style: TextStyle(
                    color: Colors.lightBlue[600],
                    fontSize: 38,
                  ),
                )),
            const SizedBox(height: 20),
            //----------DISPLAY RESULT
            Container(
                padding: const EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                height: 90,
                width: double.infinity,
                color: Colors.white60,
                child: Text(
                  '0',
                  style: TextStyle(
                    color: Colors.lightBlue[600],
                    fontSize: 38,
                  ),
                ))
          ],
        ));
  }
}
