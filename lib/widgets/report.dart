import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Report extends StatelessWidget{
  const Report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              children: [
                const Divider(color: Color.fromRGBO(203, 203, 203, 1)),
                Container(
                    height: 65,
                    child: Center(
                        child: TextButton.icon(
                            onPressed: () {},
                            label: const Text("Пожаловаться на объявление"),
                            icon: const Icon(Icons.warning_amber_rounded),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromRGBO(37, 138, 86, 1)),
                            )))),
              ],
            )));
  }

}