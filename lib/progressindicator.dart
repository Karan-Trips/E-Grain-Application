import 'package:flutter/material.dart';

class Circular_indecator extends StatelessWidget {
  Circular_indecator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.red,
        backgroundColor: Color.fromARGB(255, 109, 190, 231),
      ),
    );
  }
}
