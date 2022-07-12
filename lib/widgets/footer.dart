import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  final String mainTitle;
  final List<String> arrTitles;

  const BottomWidget(
      {Key? key, required this.mainTitle, required this.arrTitles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(mainTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 14)),
                const SizedBox(height: 20),
                for (var title in arrTitles)
                  Column(
                    children: [
                      FlatButton(
                          height:10,
                          minWidth: 0,
                          onPressed: () {},
                          child: Text(title,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                  color: Colors.black))),
                      const SizedBox(height: 15),
                    ],
                  ),
                  const Divider(color: Color.fromRGBO(203, 203, 203, 1)),
              ],
            )));
  }
}

List<String> firstTitle = [
  "Разместите объявление",
  "Платные услуги",
  "Полезные советы",
  "Отзывы",
  "Вопросы-ответы",
  "О нас",
  "Контакты"
];

List<String> secondTitle = [
  "Распространите объявление в социальных сетях",
  "Оповестите клиники и приюты",
  "Сообщите волонтёрам о пропаже",
  "Оповестите жителей района",
  "Создайте премиум-объявление",
  "Получайте уведомления о похожих питомцах",
];

List<String> thirdTitle = [
  "Станьте волонтёром",
  "Поддержите проект",
];
