import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final int value;
  const Cell({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size mediaQuery = MediaQuery.of(context).size;
    return SizedBox(
      height: mediaQuery.height*0.05,
      width: mediaQuery.width*0.1,
      child: Card(
        color: value==1?Colors.green:Colors.blue,
        shape:   OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white.withOpacity(0.6))
        ),
        child: Center(
          child: Text("$value", style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
