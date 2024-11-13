import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  final TextEditingController pesoController = new TextEditingController();
  // TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = new TextEditingController();
  // TextEditingController alturaController = TextEditingController();
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void calculate(){
    String message = "";
    if (widget.alturaController.text.isEmpty) {
      showAlertDialog1(context);
      return;

    }
    if (widget.pesoController.text.isEmpty) {
      showAlertDialog1(context);
      return;

    }

    double peso = double.parse(widget.pesoController.text);
    double altura = double.parse(widget.alturaController.text);

//    if (double.parse(widget.pesoController.text) == null ||
//        double.parse(widget.alturaController.text) == null){
//      message = "Campos Inválidos";
//      Navigator.pushNamed(
//          context,
//          "/home",
    //         arguments: message);
    //   }
    double imc = peso / (altura * altura);


    if (imc < 18.5){
      message = "Resultado: Magreza";
    }else if (imc < 24.9){
      message = "Resultado: Normal";
    }else if (imc < 29.9){
      message = "Resultado: Sobrepeso";
    }else if (imc < 34.9){
      message = "Resultado: Obesidade Grau Um";
    }else if (imc < 39.9) {
      message = "Resultado: Obesidade Grau Dois";
    }else {
      message = "Resultado: Obesidade Grau Três";
    }

    Navigator.pushNamed(
        context,
        "/result",
        arguments: message);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Cálculo de IMC"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: widget.pesoController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp("(\\d+[.]?[\\d]*)"),
                  ),
                ],
                decoration: const InputDecoration(
                  labelText: 'Insira o Peso',
                  //   floatingLabelStyle: ,
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.done,
              ),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: widget.alturaController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp("(\\d+[.]?[\\d]*)"),
                  ),
                ],
                decoration: const InputDecoration(
                  labelText: 'Insira sua altura',
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.done,
              ),
              OutlinedButton(
                onPressed: calculate,
                child: const Text("Calcular"),
              ),
              //   Text(message)
            ],
          ),
        )
    );
  }
  showAlertDialog1(BuildContext context)
  {
    // configura o button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {Navigator.of(context).pop(); },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("PESO ou ALTURA"),
      content: Text("CAMPO(S) INVÁLIDO(S)"),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}