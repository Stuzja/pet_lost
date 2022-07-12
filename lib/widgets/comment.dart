import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  final String person;
  final String text;
  final String data;
  const CommentWidget(
      {Key? key, required this.person, required this.text, required this.data})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            width: 375,
            margin: const EdgeInsets.only(
                  left: 22.0,right: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6),
                Text(person,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w500)),
                const SizedBox(height: 7),
                Text(text,
                    style: const TextStyle(
                        fontSize: 13.2, fontWeight: FontWeight.w300)),
                const SizedBox(height: 14),
                Text(data,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400)),
                const SizedBox(height: 12),
              ],
            )));
  }
}

List<CommentWidget> comments = const [
  CommentWidget(
      person: "Арсений",
      text: "“На Красноармейской пропал каракал” - звучит уже неплохо!",
      data: "Понедельник, 5:33"),
  CommentWidget(
      person: "Дмитрий",
      text: "Как вернусь в Ростов, обыщу наши подвалы, я рядом живу",
      data: "Понедельник, 6:47"),
  CommentWidget(
      person: "Арсений",
      text: "“На Красноармейской пропал каракал” - звучит уже неплохо!",
      data: "Понедельник, 17:33"),
  CommentWidget(
      person: "Женя",
      text: "Отшивался какой-то рыжий тут",
      data: "Вторник, 10:41"),
  CommentWidget(
      person: "Анна",
      text: "Вроде видела похожего возле Мёда",
      data: "Пятница, 11:07"),
  CommentWidget(
      person: "Дмитрий",
      text: "Как вернусь в Ростов, обыщу наши подвалы, я рядом живу",
      data: "Вчера, 6:47"),
  CommentWidget(
      person: "Арсений",
      text: "“На Красноармейской пропал каракал” - звучит уже неплохо!",
      data: "Сегодня, 17:33"),
];
