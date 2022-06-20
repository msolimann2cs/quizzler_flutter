import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: MainBody(),
      ),
    ),
  );
}

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 484,
          color: Colors.black,
          child: const Center(
            child: Text(
              'This is where the question text will go',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 75,
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          color: Colors.green,
          child: const Center(
            child: Text(
              'True',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 75,
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          color: Colors.red,
          child: const Center(
            child: Text(
              'False',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
