import 'package:bytebank/screens/lista.dart';
import 'package:flutter/material.dart';

//alt enter para envolver

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ListaTransferencias(),
    );
  }
}







//statelesswidget -> O contrário do statefuulwidget, estático, no momento que é construido
//não conseguimos modificar
//StatefulWidget -> Temos a capacidade de modifiicar o conteúdo do widget de maneira
// dinamica



