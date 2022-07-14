import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_lost/widgets/dopinfo.dart';
import 'package:pet_lost/widgets/footer.dart';
import 'package:pet_lost/widgets/main_info.dart';
import 'package:pet_lost/widgets/report.dart';
import 'package:share/share.dart';
import 'package:pet_lost/widgets/footer_part.dart';
import 'package:pet_lost/widgets/comment.dart';
import 'package:pet_lost/widgets/socialmediaButtons.dart';
import 'package:pet_lost/widgets/otherlostpet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
                fontFamily: "MuseoCyrl",
                color: Colors.black87),
                bodyText1: TextStyle(height: 1.5, fontSize: 13.2, fontWeight: FontWeight.w400)
          )),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _wasTap = false;
  int activePage = 0;
  bool showNumber = false;
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      //AppBar
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
              onPressed: () {
                Share.share("Пропал питомец");
              },
              icon: const Icon(Icons.upload),
              color: const Color.fromRGBO(37, 138, 86, 1),
            ),
          ]),
      body: Center(
          child: ListView(children: <Widget>[
        //Карусель фото
        Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          Container(
              height: 250,
              child: PageView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                  });
                },
                children: [
                  Image.network(shlepas[0], fit: BoxFit.fill),
                  Image.network(shlepas[1], fit: BoxFit.fill),
                  Image.network(shlepas[2], fit: BoxFit.fill),
                  Image.network(shlepas[3], fit: BoxFit.fill)
                ],
              )),
          Container(
            margin: EdgeInsets.all(20.5),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(3)),
            child: Text('  ${activePage + 1}/4  ',
                style: TextStyle(color: Colors.white, fontSize: 11)),
          )
        ]),

        Padding(
            padding: const EdgeInsets.only(left: 22.0, top: 16.93, right: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainInfo(),
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
                buildBigSocialButtons(),
                const Divider(color: Color.fromRGBO(203, 203, 203, 1)),
                DopInfoWidget(),
                const SizedBox(height: 35),
                Text("Похожие пропавшие",
                    style: Theme.of(context).textTheme.headline1),
                SizedBox(
                    height: 291,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [other[0], const SizedBox(width: 15), other[1]],
                    )),
                const SizedBox(height: 11),
                Text("11 комментариев",
                    style: Theme.of(context).textTheme.headline1),
              ],
            )),
        //Ввод комментария
        Container(
          width: mediaQuery.size.width,
          color: const Color.fromRGBO(246, 246, 246, 1),
          height: 54,
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
              child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      suffixIcon: TextButton(
                        onPressed: _controller.clear,
                        child: const Text(
                          "Отпр. ",
                          style: TextStyle(
                              color: Color.fromRGBO(37, 138, 86, 0.6),
                              fontSize: 11),
                        ),
                      ),
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Ваш комментарий...',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 5),
                      labelStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          color: Color.fromRGBO(151, 151, 153, 1))))),
        ),
        //Комменты
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

        const Report(),
        FooterWidget(),
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
