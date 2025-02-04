import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class WidgetInputComponent extends StatefulWidget {
  bool modeFormater;
  TextEditingController campo = TextEditingController();
  TextInputType? mode;
  String titulo;
  bool isDisable = false;
  WidgetInputComponent(
      {super.key,
      this.titulo = '',
      this.modeFormater = false,
      this.mode = TextInputType.text,
      required this.campo,
      this.isDisable = false});

  @override
  State<WidgetInputComponent> createState() => _WidgetInputComponentState(
      campo: campo, modeFormater: modeFormater, isDisable: isDisable);
}

class _WidgetInputComponentState extends State<WidgetInputComponent> {
  bool isDisable = false;
  bool modeFormater = false;
  TextEditingController campo;
  _WidgetInputComponentState(
      {required this.campo,
      required this.modeFormater,
      this.isDisable = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Spacer(flex: 15),
          Expanded(
              flex: 20,
              child: Column(
                children: [
                  // margem
                  Container(margin: EdgeInsets.only(bottom: 27)),
                  // icone santinha
                  Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: const Image(
                          filterQuality: FilterQuality.high,
                          height: 40,
                          fit: BoxFit.fitHeight,
                          image: AssetImage('assets/icons/icon_santinha.png'))),
                ],
              )),
          Expanded(
              flex: 100,
              child: Column(
                children: [
                  // text titulo
                  Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        widget.titulo,
                        style: const TextStyle(fontFamily: 'Kanit'),
                      )),
                  // component TextFiedld
                  TextField(
                      enabled: !isDisable,
                      inputFormatters: modeFormater
                          ? <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ]
                          : [],
                      controller: campo,
                      keyboardType: widget.mode,
                      decoration: InputDecoration(
                          hintText: 'Digite',
                          fillColor: const Color.fromRGBO(255, 255, 255, 0.442),
                          filled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 30),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(105, 215, 210, 70)),
                              borderRadius: BorderRadius.circular(23)))),
                ],
              )),
          const Spacer(flex: 25)
        ],
      ),
    );
  }
}
