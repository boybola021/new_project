

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'animation.dart';

void main()async{
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: const  HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        lottie.length, (index){
          return Column(
            children: [
              SizedBox(height: 150,child: Lottie.asset(lottie[index])),
              const SizedBox(height: 30,),
              RichText(
                textAlign: TextAlign.center,
                text:
               TextSpan(
                style:  const TextStyle(fontSize: 40,color: Colors.white),
                 children: [
                   TextSpan(text:"${name[index]}\n",),
                   TextSpan(text:desc[index],style: const TextStyle(fontSize: 18,color: Colors.grey),),
                 ]
              ),
              ),
            ],
          );
    });
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 180),
                child: SizedBox(
                  height: 290,
                  child: PageView.builder(
                    controller: controller,
                    itemBuilder: (_, index) {
                      return  pages[index % pages.length];
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24, bottom: 12),
                child: Text(
                  'Worm',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: pages.length,
                effect: const WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  type: WormType.thinUnderground,
                ),
              ),
              const SizedBox(height: 100,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40,),
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const BouncingIcon()));
                    },
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                      fixedSize: Size(
                        MediaQuery.sizeOf(context).width,
                        50,
                      ),
                    ),
                    child:  Text("Suhbatni Boshlash",style: TextStyle(fontSize: 18.sp),)
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

List<String>lottie = [
  "assets/telegram/telegram.json",
  "assets/telegram/speeder.json",
  "assets/telegram/gift.json",
  "assets/telegram/message.json",
  "assets/telegram/safe.json",
  "assets/telegram/cloude.json",
];

List<String> name = [
  telegramN,
  spederN,
  giftN,
  messageN,
  safeN,
  cloudeN,
];


List<String> desc = [
  telegramD,
  spederD,
  giftD,
  messageD,
  safeD,
  cloudeD,
];


String telegramN = "Telegram";
String spederN = "Tezkor";
String giftN = "Bepul";
String messageN = "Kuchli";
String safeN = "Xavfsiz";
String cloudeN = "Bulutli";

String telegramD = "Dunyoning eng tezkor muloqat ilovasi\nBu bepul va xavfsiz";
String spederD = "Telegram xabarni boshqa\nilovalarga qaraganda tezroq yetkazdi";
String giftD = "Telegram chatlar va media uchun bepul\ncheklanmagan bulut xotirasini taqdim etadi";
String messageD = "Telegram mediafayllar va chatlaringiz hajmiga cheklov\nquymaydi";
String safeD = "Telegram xabarlaringizni xakerlar hujumidan saqlaydi";
String cloudeD = "Telegarm xabarlaringizni bir nechta\n qurulmalardan kirish imkonini beradi";


