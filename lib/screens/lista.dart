import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/transferencia.dart';
import 'formulario.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget>createState(){
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencias>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice){
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), onPressed: () {
        final Future future = Navigator.push(context, MaterialPageRoute(builder: (context){
          return FormularioTransferencia();
        }));
        future.then((transferenciaRecebida){
         // Future.delayed(Duration(seconds: 1), (){ //Caso queira adicionar um delay na inserção de dados
            _atualiza(transferenciaRecebida);
        //  });
        });
      },
      ),
    );
  }

  void _atualiza(transferenciaRecebida) {
    if(transferenciaRecebida != null){
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;
  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numeroConta.toString()),
        )
    );
  }
}