import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RiveAnimationApp()));
                  setState(() {});
                },
                icon: const Icon(Icons.arrow_forward)),
          ],
        ),
        body: Center(
          child: ListView(
            children: [
              Lottie.asset("assets/lottie/lotte2.json"),
              Lottie.asset("assets/lottie/lotte3.json"),
              Lottie.asset("assets/lottie/lottie1.json"),
              for(var i in listRive)
              RiveAnimation.asset(i),
            ],
          ),
        ));
  }
}

class RiveAnimationApp extends StatefulWidget {
  const RiveAnimationApp({Key? key}) : super(key: key);

  @override
  State<RiveAnimationApp> createState() => _RiveAnimationAppState();
}

class _RiveAnimationAppState extends State<RiveAnimationApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: listRive.length,
            itemBuilder: (context,i){
              return RiveAnimation.asset(listRive.first);
            },
          ),
        ],
      ),
    );
  }
}


List listRive = const [
  "assets/rive/850-1653-smiley-switch.riv",
  "assets/rive/1030-2020-liquid-download.riv",
  "assets/rive/2686-5508-koneksi-terputus.riv",
  "assets/rive/3157-6670-notion-animation-concept.riv",
];