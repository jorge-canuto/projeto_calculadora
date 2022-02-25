import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String display = "0";
  String op = "";
  String operando1 = "";
  String operando2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Center(
                child: tela(),
              ),
            ),
            Expanded(
              flex: 7,
              child: keyboard(),
            )
          ],
        ),
      ),
    );
  }

  Widget keyboard(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: ()=> addTela("7"),
              child: Text("7", style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightBlue)),
            ),
            ElevatedButton(
              onPressed: ()=> addTela("8"),
              child: Text("8", style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightBlue)),
            ),
            ElevatedButton(
              onPressed: ()=> addTela("9"),
              child: Text("9", style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightBlue)),
            ),
            ElevatedButton(
              onPressed: ()=> operacao("/"),
              child: Text("/", style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.grey)),
            )
          ],
        ),


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: ()=> addTela("4"),
              child: Text("4", style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightBlue)),
            ),
            ElevatedButton(
              onPressed: ()=> addTela("5"),
              child: Text("5", style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightBlue)),
            ),
            ElevatedButton(
              onPressed: ()=> addTela("6"),
              child: Text("6", style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightBlue)),
            ),
            ElevatedButton(
              onPressed: ()=> operacao("*"),
              child: Text("*", style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.grey)),
            )
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: ()=> addTela("1"),
              child: Text("1", style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightBlue)),
            ),
            ElevatedButton(
              onPressed: ()=> addTela("2"),
              child: Text("2", style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightBlue)),
            ),
            ElevatedButton(
              onPressed: ()=> addTela("3"),
              child: Text("3", style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightBlue)),
            ),
            ElevatedButton(
              onPressed: ()=> operacao("-"),
              child: Text("-", style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.grey)),
            )
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton (
              onPressed: () => limpaTela(),
              child: Text("C", style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightBlue)),
            ),
            ElevatedButton(
              onPressed: ()=> addTela("0"),
              child: Text("0", style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightBlue)),
            ),
            ElevatedButton(
              onPressed: ()=> igual(),
              child: Text("=", style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.grey)),
            ),
            ElevatedButton(
              onPressed: ()=> operacao("+"),
              child: Text("+", style: TextStyle(color: Colors.white, fontSize: 20.0)),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.grey)),
            )
          ],
        )
      ],
    );
  }

  Widget tela(){
    return Text(
      "$display", style: TextStyle(fontSize: 30.0),
    );
  }

  void addTela(String tecla){
    if(display.length == 1 && tecla == "0"){
      display;
    }
    else if(display == "0"){
      setState(() {
        display = "";
        display += tecla;
      });
    }
    else{
      setState(() {
        display += tecla;
      });
    }
    print("$display");
  }

  void limpaTela(){
    setState(() {
      display = "0";
    });
    print("$display");
  }

  void operacao(String operador){
    op = operador;
    operando1 = display;
    setState(() {
      display = "";
    });
  }

  void igual() {
    operando2 = display;
    int resultado;

    if (op == "+") {
      resultado = int.parse(operando1) + int.parse(operando2);
      setState(() {
        display = resultado.toString();
      });
    }
    else if (op == "-") {
      resultado = int.parse(operando1) - int.parse(operando2);
      setState(() {
        display = resultado.toString();
      });
    }
    else if (op == "/") {
      resultado = int.parse(operando1) ~/ int.parse(operando2);
      setState(() {
        display = resultado.toString();
      });
    }
    else if (op == "*") {
      resultado = int.parse(operando1) * int.parse(operando2);
      setState(() {
        display = resultado.toString();
      });
    }
  }

}
