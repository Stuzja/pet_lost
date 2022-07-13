import 'package:flutter/material.dart';
import 'package:pet_lost/widgets/footer.dart';
import 'package:pet_lost/widgets/comment.dart';
import 'package:pet_lost/widgets/socialmediaButtons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pet_lost/widgets/otherlostpet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _wasTap = false;
  int activePage = 0;
  bool showNumber = false;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 100,
          leading: Row(children: const [
            BackButton(
              color: Color.fromRGBO(37, 138, 86, 1),
            ),
            Text('Назад',
                style: TextStyle(
                    color: Color.fromRGBO(37, 138, 86, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w500))
          ]),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _wasTap = !_wasTap;
                });
              },
              icon: _wasTap
                  ? const Icon(Icons.favorite_sharp)
                  : const Icon(Icons.favorite_outline),
              color:
                  _wasTap ? Colors.red : const Color.fromRGBO(37, 138, 86, 1),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.upload),
              color: const Color.fromRGBO(37, 138, 86, 1),
            ),
          ]),
      body: Center(
          child: ListView(children: <Widget>[
        Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          SizedBox(
              height: 250,
              child: PageView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                  });
                },
                children: [
                  Image.network(shlepas[0]),
                  Image.network(shlepas[1]),
                  Image.network(shlepas[2]),
                  Image.network(shlepas[3])
                ],
              )),
          Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(3)),
              child: Text('  ${activePage + 1}/4  ',
                  style: TextStyle(color: Colors.white, fontSize: 11)),
              margin: EdgeInsets.all(20.5))
        ]),
        Padding(
            padding: const EdgeInsets.only(
                left: 22.0, top: 16.93, right: 22.0, bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Пропал кот",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      fontFamily: "MuseoCyrl"),
                ),
                const SizedBox(height: 13),
                const Text("Красноармейская улица, 37, Ростов-на-Дону",
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
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
                    style:
                        TextStyle(fontSize: 13.2, fontWeight: FontWeight.w400)),
                const SizedBox(height: 25),
                Container(
                    height: 45,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(3)),
                    child: Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: showNumber
                                  ? Colors.white
                                  : const Color.fromRGBO(207, 233, 220, 1),
                              elevation: 0,
                            ),
                            onPressed: () {
                              setState(() {
                                showNumber = !showNumber;
                              });
                            },
                            child: Center(
                                child: showNumber
                                    ? const Text('8-800-555-35-35',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black))
                                    : const Text('Показать номер хозяина',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)))))),
                const SizedBox(height: 17),
                const Text("Поделиться",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(height: 15),
                Row(children: [
                  buildBigSocialButton(
                    icon: FontAwesomeIcons.facebookSquare,
                    color: Color(0xFF0075fc),
                    onClicked: () => share(SocialMedia.facebook),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  buildBigSocialButton(
                    icon: FontAwesomeIcons.twitter,
                    color: Color(0xFF1da1f2),
                    onClicked: () => share(SocialMedia.twitter),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  buildBigSocialButton(
                    icon: FontAwesomeIcons.vk,
                    color: const Color.fromRGBO(39, 135, 245, 1),
                    onClicked: () => share(SocialMedia.twitter),
                  ),
                ]),
                const Divider(color: Color.fromRGBO(203, 203, 203, 1)),
                Row(
                  children: [
                    Column(
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
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
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
                const SizedBox(height: 35),
                const Text("Похожие пропавшие",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        fontFamily: "MuseoCyrl")),
                SizedBox(
                    height: 291,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [other[0], const SizedBox(width: 15), other[1]],
                    )),
                const SizedBox(height: 11),
                const Text("11 комментариев",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        fontFamily: "MuseoCyrl")),
              ],
            )),
        Container(
          color: const Color.fromRGBO(246, 246, 246, 1),
          height: 54,
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
              child: const TextField(
                  decoration: InputDecoration(
                      suffixText: "Отпр. ",
                      suffixStyle: TextStyle(
                          color: Color.fromRGBO(37, 138, 86, 0.6),
                          fontSize: 11),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Ваш комментарий...',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          color: Color.fromRGBO(151, 151, 153, 1))))),
        ),
        const SizedBox(height: 8),
        Column(
          children: [
            Container(
                color: const Color.fromRGBO(241, 252, 239, 1),
                child: comments[0]),
            comments[1],
            comments[2],
            comments[3],
            comments[4],
            comments[5],
            comments[6],
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(left: 22.0, right: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(color: Color.fromRGBO(203, 203, 203, 1)),
                const SizedBox(height: 20),
                SizedBox(
                    height: 23,
                    child: Align(
                        alignment: Alignment.center,
                        child: TextButton.icon(
                            onPressed: () {},
                            label: const Text("Пожаловаться на объявление"),
                            icon: const Icon(Icons.warning_amber_rounded),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromRGBO(37, 138, 86, 1)),
                            )))),
                const SizedBox(height: 22),
              ],
            )),
        Container(
            color: const Color.fromRGBO(246, 246, 246, 1),
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(children: [
              BottomWidget(mainTitle: "PET911", arrTitles: firstTitle),
              BottomWidget(
                  mainTitle: "УСКОРЬТЕ ПОИСК ПИТОМЦА", arrTitles: secondTitle),
              BottomWidget(mainTitle: "ПОМОЩЬ", arrTitles: thirdTitle),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(height: 20),
                const Text("СВЯЗАТЬСЯ С НАМИ",
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
                const SizedBox(height: 20),
                Row(children: [
                  Column(children: const [
                    Text("8 (800) 350-06-10",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 19)),
                    Text("Пн-Пт с 9:00 до 18:00 (МСК)",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400))
                  ]),
                  const SizedBox(width: 33),
                  Row(children: [
                  buildSmallSocialButton(
                    icon: FontAwesomeIcons.facebookSquare,
                    onClicked: () => share(SocialMedia.facebook),
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  buildSmallSocialButton(
                    icon: FontAwesomeIcons.twitter,
                    onClicked: () => share(SocialMedia.twitter),
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                 buildSmallSocialButton(
                    icon: FontAwesomeIcons.vk,
                    onClicked: () => share(SocialMedia.twitter),
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                 buildSmallSocialButton(
                    icon: FontAwesomeIcons.odnoklassniki,
                    onClicked: () => share(SocialMedia.twitter),
                  ),
                ]),
                ]),
              ]),
            ])),
        const SizedBox(height: 29),
        const Divider(color: Color.fromRGBO(203, 203, 203, 1)),
        Padding(
            padding: const EdgeInsets.only(left: 22.0, right: 22.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  LastPartButtonWidget(
                      text: "Пропавшие и найденные животные России"),
                  LastPartButtonWidget(
                      text: "Пропавшие и найденные животные России по породам"),
                  SizedBox(height: 7),
                  LastPartButtonWidget(text: "Политика конфеденциальности"),
                  LastPartButtonWidget(text: "Условия пользования"),
                ])),
        const SizedBox(height: 55)
      ])),
    );
  }
}

List<String> shlepas = [
  "https://i.ytimg.com/vi/fkhzzwiy3-g/maxresdefault.jpg",
  "https://i.ytimg.com/vi/zDhxA8rZY4k/maxresdefault.jpg",
  "https://i.ytimg.com/vi/OzdbnqFS6aQ/maxresdefault.jpg",
  "https://chudo-prirody.com/uploads/posts/2021-08/1628938800_69-p-russkii-kot-shlepa-foto-80.jpg"
];
