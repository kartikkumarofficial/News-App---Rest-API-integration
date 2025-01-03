import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('News App'),
      ),
      body:Container(
        child:
        ListView.builder(
            // itemCount: .length,
            itemBuilder: (context,index) {
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.red,
              );

            },
        ),

      ),
    );;
  }
}
