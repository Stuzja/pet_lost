import 'package:flutter/material.dart';

class OtherLostPetWidget extends StatelessWidget {
  final String link;
  final String title;
  final String text;
  final String data;

  const OtherLostPetWidget(
      {Key? key,
      required this.link,
      required this.title,
      required this.text,
      required this.data})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            height: 291,
            width: 289,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    image: DecorationImage(
                        image: Image.network(
                          link,
                        ).image,
                        fit: BoxFit.fill),
                  ),
                  height: 181,
                  width: 289,
                )),
                const SizedBox(height:11),
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 17)),
                         const SizedBox(height:13),
                Text(text,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12)),
                         const SizedBox(height:10),
                Text(data,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color.fromRGBO(151, 151, 153, 1))),
              ],
            )));
  }
}

List<OtherLostPetWidget> other = [
  const OtherLostPetWidget(
      link:
          "https://placepic.ru/wp-content/uploads/2018/12/1446210278_funny-shake-cats-in-slow-motion-7.jpg",
      title: "Найдена кошка, 3-я круговая улица",
      text:
          "На западном пропала собака овчарка, приметы: рост метров двадцать ...",
      data: "8.10.2021"),
  const OtherLostPetWidget(
      link:
          "https://mobimg.b-cdn.net/v3/fetch/3d/3d992ea127c43bf02d8b3f431c80c17b.jpeg",
      title: "Найдена кошка, 3-я круговая улица",
      text:
          "На западном пропала собака овчарка, приметы: рост метров двадцать ...",
      data: "8.10.2021")
];
