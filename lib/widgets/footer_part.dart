import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  final String mainTitle;
  final List<String> arrTitles;

  const BottomWidget({Key? key, required this.mainTitle, required this.arrTitles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height:20),
                Text(mainTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 14)),
                               const SizedBox(height: 20),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  for (var title in arrTitles)
                    TextButton(
                      onPressed: () {},
                      child: Text(title,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Colors.black)),
                    )
                ]),
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
  "О нас   ",
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

class LastPartButtonWidget extends StatelessWidget {
  final String text;
  const LastPartButtonWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Column( children: [
      TextButton(
          onPressed: () {},
          child: Text(text,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: Color.fromRGBO(140, 140, 140, 1)))),
    ]));
  }
}

