import 'dart:math';
import 'package:flutter/material.dart';
import 'package:planet_anim/screen/home/model/planet_model.dart';
import 'package:planet_anim/screen/home/provider/planet_provider.dart';
import 'package:provider/provider.dart';
import '../../../utils/share_helper.dart';
import '../../../utils/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  PlanetProvider? providerr;
  PlanetProvider? providerw;
  AnimationController? animationController;
  Animation? rotate;

  @override
  void initState() {
    super.initState();
    context.read<PlanetProvider>().getData();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );
    rotate = Tween<double>(begin: 10, end: 10).animate(animationController!);
    animationController!.repeat();
    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<PlanetProvider>();
    providerw = context.watch<PlanetProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){},icon: Icon(Icons.menu),),
          title: const Text("Planets"),
          actions: [
            Consumer<ThemeProvider>(
              builder: (context, value, child) => Switch(
                value: value.isLight,
                onChanged: (value1) {
                  ShareHelper shr = ShareHelper();
                  shr.setTheme(value1);
                  value.changeThem();
                },
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child:
              Image.asset("assets/images/homepage.jpg"),
            ),
            ListView.builder(
              itemCount: providerw!.planets.length,
              itemBuilder: (context, index) {
                PlanetModel dataList = providerw!.planets[index];
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, 'detail',
                        arguments: dataList);
                  },
                  child: Container(
                    height: 110,
                    width: double.infinity,
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform.rotate(
                            angle: animationController!.value * 2 * pi,
                            child: Image.asset("${providerw!.planets[index].img}")),
                        Text(
                          "${providerw!.planets[index].name}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {

                            },
                            icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,))
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
