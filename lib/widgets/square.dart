import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:island_finder/widgets/cell.dart';

class Square extends StatelessWidget {
  final List<List <int>> matrix;

  const Square({Key? key, required this.matrix}) : super(key: key);

  List <Widget> mapCells (BuildContext context){
    List <Widget> rows = List<Widget>.generate(matrix.length,(int index1) =>
        Row(
          children: List<Widget>.generate(matrix.length,(int index2) => Cell(
              value: matrix[index1][index2]==2?1:matrix[index1][index2]
          )),
        )
    );

    return rows;
  }


  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(mediaQuery.height*0.05),
      height: mediaQuery.height*0.6,
      width: mediaQuery.width*0.8,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
              children: mapCells (context)
          ),
        ),
      ),
    );
  }
}
