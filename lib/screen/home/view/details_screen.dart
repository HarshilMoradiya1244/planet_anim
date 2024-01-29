import 'dart:math';

import 'package:flutter/material.dart';
import 'package:planet_anim/screen/home/model/planet_model.dart';
import 'package:provider/provider.dart';

import '../provider/planet_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with TickerProviderStateMixin {
  PlanetProvider? providerr;
  PlanetProvider? providerw;
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    context.read<PlanetProvider>().getData();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3),);
    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<PlanetProvider>();
    providerw = context.watch<PlanetProvider>();
    PlanetModel l1 = ModalRoute.of(context)!.settings.arguments as PlanetModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Planet Detail"),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_border))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade100,
                ),
                child: AnimatedBuilder(
                  animation: animationController!,
                  builder: (context, child) {
                    return Transform.rotate(angle: animationController!.value);
                  },
                    child :Image.asset(
                      "${l1.land}",
                      fit: BoxFit.cover,
                    ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "${l1.name}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              Text("${l1.description}"),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Temperature : ${l1.temperature}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "Mass : ${l1.mass}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Radius : ${l1.radius}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "Period : ${l1.period}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Distance Light Year : ${l1.distance_light_year}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                "Semi Major Axis : ${l1.semi_major_axis}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                "Host Star Temperature : ${l1.host_star_temperature}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                "Host Star Mass : ${l1.host_star_mass}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
