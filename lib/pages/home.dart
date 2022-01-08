import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:island_finder/widgets/square.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> with SingleTickerProviderStateMixin{
  final TextEditingController _inputController=TextEditingController();
  late List <List <int>> matrixFinal;
  late AnimationController _animationController;
  int island=0;


  void solveNumberOfIslands(BuildContext context) {
    setState(() {
      island=0;
    });
    int auxSize=2;
    try{
      auxSize=int.parse(_inputController.text);
    }catch(error){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Valor no aceptado"),
      ));
    }
    if(auxSize>20){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Valor debe ser menor a 20"),
      ));
      return;
    }


    List<List<int>> newMatrix= mapCells(auxSize);


    for(int i=0;i<auxSize;i++){
      for(int j=0;j<auxSize;j++){
        if(newMatrix[i][j]==1){
          int auxCont=0;
          int globalCont=0;
          checkCurrentPosition(newMatrix,i,j,auxSize,auxCont, globalCont);
        }
      }
    }


    _showMyDialog(context, island);
  }

  int checkCurrentPosition(List <List <int>> newMatrix, int contx, int conty, int size, int auxCont, int globalCont)
  {
    if(contx<0 || contx>size || conty<0 || conty>size || newMatrix[contx][conty]!=1){
      return 0;
    }

    newMatrix[contx][conty]=2;
    auxCont=auxCont+1;
    try{
      checkCurrentPosition(newMatrix, contx+1,conty,size, auxCont, globalCont);
    }catch(error){
      error;
    }
    try{
      checkCurrentPosition(newMatrix, contx,conty+1,size, auxCont, globalCont);
    }catch(error){
      error;
    }
    try{
      checkCurrentPosition(newMatrix, contx-1,conty,size, auxCont, globalCont);
    }catch(error){
      error;
    }
    try{
      checkCurrentPosition(newMatrix, contx,conty-1,size, auxCont, globalCont);
    }catch(error){
      error;
    }

    if(auxCont==2){
      setState(() {
        island=island+1;
      });
    }
    return auxCont;
  }


  List<List<int>> mapCells(auxSize){

    Random rng = Random();
    double falseProbability = rng.nextInt(100)/100;




    List <List <int>> matrixAux = List<List <int>>.generate(auxSize,(int index) =>
    List<int>.generate(auxSize,(int index) =>
    rng.nextDouble() > falseProbability? 1 : 0
    )
    );



    setState(() {
      matrixFinal=matrixAux;
    });

    return matrixAux;
  }

  Future<void> _showMyDialog(context, numbers) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text('Resultado'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('La cantidad de islas es: $numbers'),
                ],
              ),
            )
        );
      },
    );
  }



  @override
  void initState() {
    super.initState();
    mapCells(2);
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    Future.delayed(Duration.zero, (){
      _animationController.repeat(reverse: true);
    });

  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Solucionemos la matriz..."),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20.0),
              child: TextField(style: Theme.of(context).textTheme.bodyText2,
                keyboardType: TextInputType.number,
                controller: _inputController,
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.bodyText1,
                  hintText: 'Ingresa el tamaño de la matriz y presiona el botón',
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(15),
                ),

              ),
            ),
            Square(matrix: matrixFinal),

          ],
        ),
      ),
      floatingActionButton: FadeTransition(
        opacity: _animationController,
        child: FloatingActionButton(
          onPressed: (){solveNumberOfIslands(context);},
          tooltip: 'Solucionar',
          child: const Icon(Icons.assistant_direction),
        ),
      ),
    );
  }
}
