import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainInfo extends StatelessWidget {
  const MainInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Пропал кот", style: Theme.of(context).textTheme.headline1),
      const SizedBox(height: 13),
      const Text("Красноармейская улица, 37, Ростов-на-Дону",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
      const SizedBox(height: 6),
      GestureDetector(
          onTap: () {
            print('1');
          },
          child: const Text("Показать на карте",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(37, 138, 86, 1)))),
      const SizedBox(height: 20),
      const Text(
          "На Красноармейской пропал каракал. Предположительно выпрыгнул через открытое окно. Отзывается на свою кличку “Шлёпа” или “Русский кот”. Очень любит пельмени. Клеймо отсутствует, полное телосложение. Чистый и ухоженный, людей не боится.",
          style: TextStyle(fontSize: 13.2, fontWeight: FontWeight.w400)),
    ]));
  }
}
