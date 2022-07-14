import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_lost/widgets/footer_part.dart';
import 'package:pet_lost/widgets/socialmediaButtons.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            color: const Color.fromRGBO(246, 246, 246, 1),
            child: Column(children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: Column(children: [
                    BottomWidget(mainTitle: "PET911", arrTitles: firstTitle),
                    BottomWidget(
                        mainTitle: "УСКОРЬТЕ ПОИСК ПИТОМЦА",
                        arrTitles: secondTitle),
                    BottomWidget(mainTitle: "ПОМОЩЬ", arrTitles: thirdTitle),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Text("СВЯЗАТЬСЯ С НАМИ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14)),
                          const SizedBox(height: 20),
                          Row(children: [
                            Column(children: const [
                              Text("8 (800) 350-06-10",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 19)),
                              Text("Пн-Пт с 9:00 до 18:00 (МСК)",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400))
                            ]),
                            const Spacer(),
                            buildSmallSocialButtons(),
                            const SizedBox(height: 29),
                          ]),
                        ]),
                  ])),
              Divider(),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        LastPartButtonWidget(
                            text: "Пропавшие и найденные животные России"),
                        LastPartButtonWidget(
                            text:
                                "Пропавшие и найденные животные России по породам"),
                        SizedBox(height: 7),
                        LastPartButtonWidget(
                            text: "Политика конфеденциальности"),
                        LastPartButtonWidget(text: "Условия пользования"),
                      ])),
              const SizedBox(height: 55)
            ])));
  }
}
