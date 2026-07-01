import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/widgets/plant_widget.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoritedPlants;
  const FavoritePage({super.key, required this.favoritedPlants});

  @override
  State<FavoritePage> createState() => _ScanPageState();
}

class _ScanPageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: widget.favoritedPlants.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                    child: Image.asset('assets/images/favorited.png'),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'ظاهرا به هیچی علاقه نداشتی',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20.0,
                      fontFamily: 'BYekan',
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            )
          : Container(
              height: size.height * 0.5,
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 30.0,
              ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: widget.favoritedPlants.length,
                itemBuilder: (context, index) {
                  return NewPlantWidget(
                    plantList: widget.favoritedPlants,
                    index: index,
                  );
                },
              ),
            ),
    );
  }
}
