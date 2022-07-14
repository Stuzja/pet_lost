import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DopInfoWidget extends StatelessWidget {
  const DopInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Номер объявления",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color.fromRGBO(151, 151, 153, 1))),
              SizedBox(height: 16),
              Text("Пол питомца",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color.fromRGBO(151, 151, 153, 1))),
              SizedBox(height: 16),
              Text("Добавлено",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color.fromRGBO(151, 151, 153, 1))),
              SizedBox(height: 16),
              Text("Найден(а)",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color.fromRGBO(151, 151, 153, 1))),
              SizedBox(height: 16),
              Text("Имя хозяина",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color.fromRGBO(151, 151, 153, 1))),
            ],
          ),
          const SizedBox(width: 40),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Text("RF488198",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                )),
            SizedBox(height: 16),
            Text("Мужской",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                )),
            SizedBox(height: 16),
            Text("Вт, 21.09.2021",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                )),
            SizedBox(height: 16),
            Text("Вт, 21.09.2021",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                )),
            SizedBox(height: 16),
            Text("Владимир",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                )),
          ])
        ],
      ),
    );
  }
}
