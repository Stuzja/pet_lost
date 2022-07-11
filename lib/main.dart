import 'package:flutter/material.dart';

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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Пропал кот",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 13),
                  Text("Красноармейская улица, 37, Ростов-на-Дону",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
                  SizedBox(height: 6),
                  Text("Показать на карте",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(37, 138, 86, 1))),
                  SizedBox(height: 20),
                  Text(
                      "На Красноармейской пропал каракал. Предположительно выпрыгнул через открытое окно. Отзывается на свою кличку “Шлёпа” или “Русский кот”. Очень любит пельмени. Клеймо отсутствует, полное телосложение. Чистый и ухоженный, людей не боится.",
                      style: TextStyle(
                          fontSize: 13.2, fontWeight: FontWeight.w300)),
                ],
              ))
        ]),
      ),
    );
  }
}

List<String> shlepas = [
  "https://i.ytimg.com/vi/fkhzzwiy3-g/maxresdefault.jpg",
  "https://i.ytimg.com/vi/zDhxA8rZY4k/maxresdefault.jpg",
  "https://i.ytimg.com/vi/OzdbnqFS6aQ/maxresdefault.jpg",
  "https://chudo-prirody.com/uploads/posts/2021-08/1628938800_69-p-russkii-kot-shlepa-foto-80.jpg"
];
