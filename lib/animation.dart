import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_animate/flutter_animate.dart';

const owlUrl = AssetImage("assets/bird.webp");

/*
class FadeInDemo extends StatefulWidget {
  const FadeInDemo({super.key});

  @override
  State<FadeInDemo> createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(children: <Widget>[
      Image.network(owlUrl, height: height * 0.8),
      TextButton(
        child: const Text(
          'Show Details',
          style: TextStyle(color: Colors.blueAccent),
        ),
        onPressed: () => {},
      ),
      const Column(
        children: [
          Text('Type: Owl'),
          Text('Age: 39'),
          Text('Employment: None'),
        ],
      )
    ]);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: FadeInDemo(),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MyApp(),
  );
}

 */

/// #2

/*
class FadeInDemo extends StatefulWidget {
  const FadeInDemo({super.key});

  @override
  State<FadeInDemo> createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(children: <Widget>[
      Image(image: owlUrl, height: height * 0.8),
      TextButton(
        child: const Text(
          'Show Details',
          style: TextStyle(color: Colors.blueAccent),
        ),
        onPressed: () => setState(() {
          opacity = 1;
        }),
      ),
      AnimatedOpacity(
        duration: const Duration(seconds: 2),
        opacity: opacity,
        child: const Column(
          children: [
            Text('Type: Owl'),
            Text('Age: 39'),
            Text('Employment: None'),
          ],
        ),
      )
    ]);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: FadeInDemo(),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MyApp(),
  );
}

 */

/// #3

/*
double randomBorderRadius() {
  return Random().nextDouble() * 64;
}

double randomMargin() {
  return Random().nextDouble() * 64;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  late Color color;
  late double borderRadius;
  late double margin;

  @override
  void initState() {
    super.initState();
    color = randomColor();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Container(
                margin: EdgeInsets.all(margin),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('Change'),
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedContainerDemo(),
    );
  }
}

void main() {
  runApp(
    const MyApp(),
  );
}

 */

/*
/// #4

const _duration = Duration(milliseconds: 400);

double randomBorderRadius() {
  print(" ====> ${Random().nextDouble() * 64}");
  return Random().nextDouble() * 64;
}

double randomMargin() {
  //print(" ====> ${Random().nextDouble() * 64}");
  return Random().nextDouble() * 64;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  late Color color;
  late double borderRadius;
  late double margin;

  @override
  void initState() {
    super.initState();
    color = randomColor();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
  }

  void change() {
    setState(() {
      color = randomColor();
      borderRadius = randomBorderRadius();
      margin = randomMargin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: AnimatedContainer(
                margin: EdgeInsets.all(margin),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                duration: _duration,
              ),
            ),
            ElevatedButton(
              child: const Text('Change'),
              onPressed: () => change(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedContainerDemo(),
    );
  }
}

void main() {
  runApp(
    const MyApp(),
  );
}

*/

/// cusaom animation
/*
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
  double side = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            side == 100 ? 200 : 100;
          });
        },
        child: const Icon(Icons.run_circle),
      ),
      body: AnimatedPositioned(
        height: side,
        width: side,
        curve: Curves.easeInExpo,
        duration: const Duration(seconds: 1),
        child: Container(
          height: side,
          width: side,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,),
        ),
      ),
    );
  }
}

*/

/// #2
/*
void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TweenAnimationLearn(),
    );
  }
}

class TweenAnimationLearn extends StatefulWidget {
  const TweenAnimationLearn({Key? key}) : super(key: key);

  @override
  State<TweenAnimationLearn> createState() => _TweenAnimationLearnState();
}

class _TweenAnimationLearnState extends State<TweenAnimationLearn> {

  Alignment begin =Alignment.center;
  Alignment end =Alignment.center;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            begin = end;
            if(Alignment.topCenter != end){
              end = Alignment.topCenter;
            }else{
              end = Alignment.bottomCenter;
            }
          });
        },
        child: const Icon(Icons.run_circle),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: TweenAnimationBuilder<AlignmentGeometry>(
            duration: const Duration(seconds: 2),
            tween: AlignmentTween(begin: begin,end: end),
            child: const Icon(Icons.circle_notifications,size: 60,),
            onEnd: (){
              setState(() {
                begin = end;
                if(Alignment.topCenter != end){
                  end = Alignment.topCenter;
                }else{
                  end = Alignment.bottomCenter;
                }

              });
            },
            builder: (ctx,value,child){
              return Align(
                alignment: value,
                  child: child!,
              );
            }
        ),
      ),
    );
  }
}

*/

/// #3
/*
void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TweenAnimationLearn(),
    );
  }
}

class TweenAnimationLearn extends StatefulWidget {
  const TweenAnimationLearn({Key? key}) : super(key: key);

  @override
  State<TweenAnimationLearn> createState() => _TweenAnimationLearnState();
}

class _TweenAnimationLearnState extends State<TweenAnimationLearn> {

  bool isOpasaty = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {

          });
        },
        child: const Icon(Icons.run_circle),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: TweenAnimationBuilder<double>(
            duration: const Duration(seconds: 2),
            tween: AlignmentTween(),
            child: const Icon(Icons.circle_notifications,size: 60,),
            onEnd: (){
              setState(() {});
            },
            builder: (ctx,value,child){
              return Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                ),
                child: child!,
              );
            }
        ),
      ),
    );
  }
}

 */


/// 4
/*
void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FadeTrasitionAnimationLearn(),
    );
  }
}

class FadeTrasitionAnimationLearn extends StatefulWidget {
  const FadeTrasitionAnimationLearn({Key? key}) : super(key: key);

  @override
  State<FadeTrasitionAnimationLearn> createState() => _FadeTrasitionAnimationLearnState();
}

class _FadeTrasitionAnimationLearnState extends State<FadeTrasitionAnimationLearn> with SingleTickerProviderStateMixin{

 late final AnimationController controller;
 late final  Animation<double> animation;

 @override
  void initState() {
    controller = AnimationController(vsync: this,duration: const Duration(seconds: 10))..repeat();
    animation = Tween<double>(begin: 0,end: 1).animate(controller);
    controller.forward();
    super.initState();
  }
  @override
  void dispose() {
   controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: animation,
          child: const Icon(Icons.sports_basketball_rounded,size: 200,),
        ),
      ),
    );
  }
}
*/


/// 5
/*

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimationBuliderLeran(),
    );
  }
}


class AnimationBuliderLeran extends StatefulWidget {
  const AnimationBuliderLeran({Key? key}) : super(key: key);

  @override
  State<AnimationBuliderLeran> createState() => _AnimationBuliderLeranState();
}

class _AnimationBuliderLeranState extends State<AnimationBuliderLeran> with SingleTickerProviderStateMixin{

  late final AnimationController controller;
  late final  Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(vsync: this,duration: const Duration(seconds: 5));
    animation = Tween<double>(begin: 0,end: pi * 2).animate(controller);
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.forward();
          setState(() {});
        },
        child: const Icon(Icons.run_circle),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context,child) {
            return Align(
              alignment:  Alignment(animation.value / pi - 1,0),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(animation.value),
                child: const Icon(Icons.accessibility,size: 100,),
              ),
            );
          },
        ),
      ),
    );
  }
}

*/


/// 6
/*
void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimationBuliderLeran(),
    );
  }
}


class AnimationBuliderLeran extends StatefulWidget {
  const AnimationBuliderLeran({Key? key}) : super(key: key);

  @override
  State<AnimationBuliderLeran> createState() => _AnimationBuliderLeranState();
}

class _AnimationBuliderLeranState extends State<AnimationBuliderLeran> with TickerProviderStateMixin{

  late final AnimationController controller;
  late final AnimationController controllerTwo;
  late final  Animation<double> animation;
  late final  Animation<double> animationTwo;

  @override
  void initState() {
    controller = AnimationController(vsync: this,duration: const Duration(seconds: 5));
    controllerTwo = AnimationController(vsync: this,duration: const Duration(seconds: 3));
    animation = Tween<double>(begin: 0,end: pi * 2).animate(controller);
    animationTwo = Tween<double>(begin: 0,end: 1).animate(controllerTwo);
    //controller.forward();
    controller.addListener(() {
      if(controller.isCompleted){
        controllerTwo.forward();
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.forward();
          setState(() {});
        },
        child: const Icon(Icons.run_circle),
      ),
      body: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: animation,
              builder: (context,child) {
                return Align(
                  alignment:  Alignment(animation.value / pi - 1,0),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(animation.value),
                    child: const Icon(Icons.accessibility,size: 100,),
                  ),
                );
              },
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: animationTwo,
              builder: (ctx,child){
                return Transform.scale(child: Opacity(opacity: animationTwo.value,child: child,));
              },
                child: const Text("The End",style: TextStyle(fontSize: 30),)
            ),
          )
        ],
      ),
    );
  }
}
*/


/// Takrorlash


/// #T 1


/// # jismni bir joydan ikkinchi joyga kuchirish Animation bilan

/*
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

  Alignment begin = Alignment.center;
  Alignment end = Alignment.center;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            begin = end;
            if(Alignment.topCenter != end){
              end = Alignment.topCenter;
            }else{
              end = Alignment.bottomCenter;
            }
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: TweenAnimationBuilder<AlignmentGeometry>(
          duration: const Duration(seconds: 2),
          tween: AlignmentTween(begin: begin,end: end),
          child: const Icon(Icons.sports_basketball_rounded,size: 200,),
          builder: (ctx,value,child){
            return Align(
              alignment: value,
              child: child!,
            );
          },
        ),
      ),
    );
  }
}
*/

/// #T 2
/*
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

  Alignment begin = Alignment.center;
  Alignment end = Alignment.center;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {});
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: TweenAnimationBuilder<double>(
          duration: const Duration(seconds: 3),
          tween: Tween<double>(begin: 0,end: 1),
          curve: Curves.easeInOutCubic,
          builder: (ctx,value,child){
            return Center(
              child: Opacity(
                opacity: value,
                child: Icon(Icons.sports_basketball_rounded, size : value * 180
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

*/

/// #T 3

/*
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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  Alignment begin = Alignment.center;
  Alignment end = Alignment.center;
  late final AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    /// controller Animtionni controller qilib beradi
    controller = AnimationController(vsync: this,
        duration: const Duration(seconds: 5),);
    /// animation bu animation qilib beradi.
    animation = Tween<double>(begin: 0,end: 1).animate(controller);

    /// controller.forward(); funksiya orqali animationni run qilib beradi
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            controller.forward();
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: Center(
        /// FadeTransition bir colordan 2 - colorga utadi
        child: FadeTransition(
          opacity: animation,
          child: const Icon(Icons.sports_basketball_rounded,size: 200,),
        ),
      ),
    );
  }
}
*/

/// #T 4

/*
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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  late final AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    /// controller Animtionni controller qilib beradi
    controller = AnimationController(vsync: this,
      duration: const Duration(seconds: 4),);
    /// animation bu animation qilib beradi.
    animation = Tween<double>(begin: 0,end: 4 * pi).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            controller.forward();
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (ctx,child){
            return Align(
              alignment: Alignment(animation.value / (2 * pi) - 1, 0),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(animation.value),
                child: const Icon(Icons.accessibility,size: 100,),
              ),
            );
          },
        )
      ),
    );
  }
}
*/


/// #T 5

/*

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

class _HomeState extends State<Home> with TickerProviderStateMixin{

  late final AnimationController controller;
  late final AnimationController controllerTwo;
  late Animation<double> animation;
  late Animation<double> animationTwo;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 4),);
    controllerTwo = AnimationController(vsync: this, duration: const Duration(seconds: 1),);

    animation = Tween<double>(begin: 0,end: 4 * pi).animate(controller);
    animationTwo = Tween<double>(begin: 0,end: 1).animate(controllerTwo);
    controller.addListener(() {
      if(controller.isCompleted){
        controllerTwo.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    controllerTwo.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            controller.forward();
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: Stack(
        children: [
          Center(
              child: AnimatedBuilder(
                animation: animation,
                builder: (context,child){
                  return Align(
                    alignment: Alignment(animation.value / (2 * pi) - 1, 0),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationZ(animation.value),
                      child: const Icon(Icons.accessibility,size: 100,),
                    ),
                  );
                },
              ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: animationTwo,
              builder: (context,child){
                return Transform.scale(
                  scale: animationTwo.value,
                  child: Opacity(
                    opacity: animationTwo.value,
                    child: child!,
                  ),
                );
              },
              child:  const Text("The End",style:  TextStyle(fontSize: 40,fontWeight: FontWeight.w900)),
            ),
          ),
        ],
      ),
    );
  }
}

 */


/// #Expandable Card

/*
void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExpandCardDemo(),
    );
  }
}

class ExpandCardDemo extends StatelessWidget {
  const ExpandCardDemo({super.key});
  static const String routeName = 'misc/expand_card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expandable Card'),
      ),
      body: const Center(
        child: ExpandCard(),
      ),
    );
  }
}

class ExpandCard extends StatefulWidget {
  const ExpandCard({super.key});
  @override
  State<ExpandCard> createState() => _ExpandCardState();
}

class _ExpandCardState extends State<ExpandCard>
    with SingleTickerProviderStateMixin {
  static const Duration duration = Duration(milliseconds: 300);
  bool selected = false;

  double get size => selected ? 250 : 128;

  void toggleExpanded() {
    setState(() {
      selected = !selected;
    });
  }

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () => toggleExpanded(),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            duration: duration,
            width: size,
            height: size,
            curve: Curves.ease,
            child: AnimatedCrossFade(
              duration: duration,
              firstCurve: Curves.easeInOutCubic,
              secondCurve: Curves.easeInOutCubic,
              crossFadeState: selected
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              layoutBuilder:
                  (topChild, topChildKey, bottomChild, bottomChildKey) {
                return Stack(
                  children: [
                    Positioned.fill(
                      key: bottomChildKey,
                      child: bottomChild,
                    ),
                    Positioned.fill(
                      key: topChildKey,
                      child: topChild,
                    ),
                  ],
                );
              },
              firstChild: Image.asset(
                "assets/images/img_1.webp",
                fit: BoxFit.cover,
              ),
              secondChild: Image.asset(
                'assets/images/img_1.webp',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

*/

/// #Carousel

/*
void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CarouselDemo(),
    );
  }
}

class CarouselDemo extends StatefulWidget {
  const CarouselDemo({Key? key}) : super(key: key);

  @override
  State<CarouselDemo> createState() => _CarouselDemoState();
}

class _CarouselDemoState extends State<CarouselDemo> {

  static const List<String> routImg = [
   "assets/images/ima_3.webp",
   "assets/images/img_1.webp",
   "assets/images/img_2.webp",
  ];

 final  List<Widget> images = routImg.map((file) => Image.asset(file,fit: BoxFit.cover,)).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carousel Demo"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: AspectRatio(aspectRatio: 1,
          child: Carousel(
            itemBuilder: widgetBuilder,
          ),
          ),
        ),
      ),
    );
  }
  Widget widgetBuilder(BuildContext context, int index) {
    print("${index % images.length}");
    return images[index % images.length];
  }
}

 typedef OnCurrentItemChangedCallback = void Function(int currentItem);

class Carousel extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  const Carousel({Key? key, required this.itemBuilder}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late final PageController _controller;
  late int _currentPage;
  bool _pageHasChanged = false;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _controller = PageController(
      viewportFraction: 0.85,
      initialPage: _currentPage,
    );
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return PageView.builder(
      onPageChanged: (value){
        setState(() {
          _pageHasChanged = true;
          _currentPage = value;
        });
      },
        controller: _controller,
        scrollBehavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            // PointerDeviceKind.unknown,
            // PointerDeviceKind.invertedStylus,
            //  PointerDeviceKind.stylus,
            //  PointerDeviceKind.trackpad,
          }
        ),
        itemBuilder: (context,index) => AnimatedBuilder(
            animation: _controller,
            builder: (context,child){
              var result = _pageHasChanged ? _controller.page! : _currentPage * 1.0;

              var value = result - index;
              value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
              return Center(
                child: SizedBox(
                  height: Curves.easeOut.transform(value) * size.height,
                  width: Curves.easeOut.transform(value) * size.width,
                  child: child,
                ),
              );
            },
            child: widget.itemBuilder(context,index),
        ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
*/


/// #Focus image

/*
void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FocusImageDemo(),
    );
  }
}


class FocusImageDemo extends StatelessWidget {
  const FocusImageDemo({super.key});
  static String routeName = "assets/images/ima_3.webp";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Focus Image')),
      body: const Grid(),
    );
  }
}

class Grid extends StatelessWidget {
  const Grid({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 40,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) {
          return (index >= 20)
              ? const SmallCard(
            imageAssetName: "assets/images/ima_3.webp",
          )
              : const SmallCard(
            imageAssetName: "assets/images/ima_3.webp",
          );
        },
      ),
    );
  }
}

Route _createRoute(BuildContext parentContext, String image) {
  return PageRouteBuilder<void>(
    pageBuilder: (context, animation, secondaryAnimation) {
      return _SecondPage(image);
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var rectAnimation = _createTween(parentContext)
          .chain(CurveTween(curve: Curves.ease))
          .animate(animation);

      return Stack(
        children: [
          PositionedTransition(rect: rectAnimation, child: child),
        ],
      );
    },
  );
}

Tween<RelativeRect> _createTween(BuildContext context) {
  var windowSize = MediaQuery.of(context).size;
  var box = context.findRenderObject() as RenderBox;
  var rect = box.localToGlobal(Offset.zero) & box.size;
  var relativeRect = RelativeRect.fromSize(rect, windowSize);

  return RelativeRectTween(
    begin: relativeRect,
    end: RelativeRect.fill,
  );
}

class SmallCard extends StatelessWidget {
  const SmallCard({required this.imageAssetName, super.key});
  final String imageAssetName;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        child: InkWell(
          onTap: () {
            var nav = Navigator.of(context);
            nav.push<void>(_createRoute(context, imageAssetName));
          },
          child: Image.asset(
            imageAssetName,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _SecondPage extends StatelessWidget {
  final String imageAssetName;

  const _SecondPage(this.imageAssetName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                imageAssetName,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

 */

/// #Card Swipe

/*
void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CardSwipeDemo(),
    );
  }
}


class CardSwipeDemo extends StatefulWidget {
  const CardSwipeDemo({super.key});
  static String routeName = "assets/images/ima_3.webp";

  @override
  State<CardSwipeDemo> createState() => _CardSwipeDemoState();
}

class _CardSwipeDemoState extends State<CardSwipeDemo> {
  late List<String> fileNames;

  @override
  void initState() {
    super.initState();
    _resetCards();
  }

  void _resetCards() {
    fileNames = [
      "assets/images/ima_3.webp",
      "assets/images/img_1.webp",
      "assets/images/img_2.webp",
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Swipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ClipRect(
                  child: Stack(
                    children: [
                      for (final fileName in fileNames)
                        SwipeableCard(
                          imageAssetName: fileName,
                          onSwiped: () {
                            setState(() {
                              fileNames.remove(fileName);
                            });
                          },
                        ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('Refill'),
                onPressed: () {
                  setState(() {
                    _resetCards();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String imageAssetName;

  const Card({required this.imageAssetName, super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 5,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: AssetImage(imageAssetName),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class SwipeableCard extends StatefulWidget {
  final String imageAssetName;
  final VoidCallback onSwiped;

  const SwipeableCard(
      {required this.onSwiped, required this.imageAssetName, super.key});

  @override
  State<SwipeableCard> createState() => _SwipeableCardState();
}

class _SwipeableCardState extends State<SwipeableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late double _dragStartX;
  bool _isSwipingLeft = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this);
    _animation = _controller.drive(Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1, 0),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: GestureDetector(
        onHorizontalDragStart: _dragStart,
        onHorizontalDragUpdate: _dragUpdate,
        onHorizontalDragEnd: _dragEnd,
        child: Card(imageAssetName: widget.imageAssetName),
      ),
    );
  }

  /// Sets the starting position the user dragged from.
  void _dragStart(DragStartDetails details) {
    _dragStartX = details.localPosition.dx;
  }


  void _dragUpdate(DragUpdateDetails details) {
    var isSwipingLeft = (details.localPosition.dx - _dragStartX) < 0;
    if (isSwipingLeft != _isSwipingLeft) {
      _isSwipingLeft = isSwipingLeft;
      _updateAnimation(details.localPosition.dx);
    }

    setState(() {
      final size = context.size;

      if (size == null) {
        return;
      }

      _controller.value =
          (details.localPosition.dx - _dragStartX).abs() / size.width;
    });
  }


  void _dragEnd(DragEndDetails details) {
    final size = context.size;

    if (size == null) {
      return;
    }

    var velocity = (details.velocity.pixelsPerSecond.dx / size.width).abs();
    _animate(velocity: velocity);
  }

  void _updateAnimation(double dragPosition) {
    _animation = _controller.drive(Tween<Offset>(
      begin: Offset.zero,
      end: _isSwipingLeft ? const Offset(-1, 0) : const Offset(1, 0),
    ));
  }

  void _animate({double velocity = 0}) {
    var description =
    const SpringDescription(mass: 50, stiffness: 1, damping: 1);
    var simulation =
    SpringSimulation(description, _controller.value, 1, velocity);
    _controller.animateWith(simulation).then<void>((_) {
      widget.onSwiped();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

 */

/// #Flutter Animate

/*
void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FlutterAnimateDemo(),
    );
  }
}

class FlutterAnimateDemo extends StatelessWidget {

  const FlutterAnimateDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animate Demo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text("Hello Flutter Animate", style: Theme.of(context).textTheme.headlineLarge,)
              .animate(
            onPlay: (controller) => controller.repeat(),
          )
              .then(delay: 250.ms)
              .fadeIn(duration: 500.ms)
              .then(delay: 250.ms)
              .shimmer(duration: 400.ms)
              .then(delay: 250.ms)
              .slide()
              .then(delay: 250.ms)
              .blur(duration: 500.ms)
              .then(delay: 100.ms),
        ),
      ),
    );
  }
}
*/

/// #Repeating Animation

/*
void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RepeatingAnimationDemo(),
    );
  }
}

class RepeatingAnimationDemo extends StatefulWidget {
  const RepeatingAnimationDemo({super.key});

  @override
  State<RepeatingAnimationDemo> createState() => _RepeatingAnimationDemoState();
}

class _RepeatingAnimationDemoState extends State<RepeatingAnimationDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<BorderRadius?> _borderRadius;

  @override
  void initState() {
    super.initState();

    _controller =
    AnimationController(duration: const Duration(seconds: 2), vsync: this)
      ..repeat(reverse: true);

    _borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(100.0),
      end: BorderRadius.circular(0.0),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Repeating Animation')),
      body: Center(
        child: AnimatedBuilder(
          animation: _borderRadius,
          builder: (context, child) {
            return Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: _borderRadius.value,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
*/



void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BouncingIcon(),
    );
  }
}




class BouncingIcon extends StatefulWidget {
  const BouncingIcon({Key? key}) : super(key: key);

  @override
  State<BouncingIcon> createState() => _BouncingDVDState();
}

class _BouncingDVDState extends State<BouncingIcon> {
  Random random = Random();
  Color dvdColor = Colors.pink;
  double iconWidth = 125, iconHeight = 125;
  double x = 90, y = 30, xSpeed = 40, ySpeed = 40, speed = 150;

 void pickColor() {
    Timer(const Duration(milliseconds: 100), () {
      int r = random.nextInt(255);
      int g = random.nextInt(255);
      int b = random.nextInt(255);
      dvdColor = Color.fromRGBO(r, g, b, 1);
    });
  }

  @override
  initState() {
    super.initState();
    update();
  }

  void update() {
    Timer.periodic(Duration(milliseconds: speed.toInt()), (timer) {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;
      x += xSpeed;
      y += ySpeed;

      if (x + iconWidth >= screenWidth) {
        xSpeed = -xSpeed;
        x =  screenWidth - iconWidth;
        pickColor();
      } else if (x <= 0) {
        xSpeed = -xSpeed;
        x = 0;
        pickColor();
      }

      if (y + iconHeight >= screenHeight) {
        ySpeed = -ySpeed;
        y = screenHeight - iconHeight;
        pickColor();
      } else if (y <= 0) {
        ySpeed = -ySpeed;
        y = 0;
        pickColor();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: speed.toInt()),
            left: x,
            top: y,
            child:  Container(
              height: 80,
                width: 80,
                color: dvdColor,
                alignment: Alignment.center,
                child: const Text("DVD",style: TextStyle(fontSize: 23,color: Colors.white))),
          ),
        ],
      ),
    );
  }
}