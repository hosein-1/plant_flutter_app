import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/widgets/plant_widget.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/widgets/extensions.dart';
class CartPage extends StatefulWidget {
  final List<Plant> addToCartPlants;
  const CartPage({super.key, required this.addToCartPlants});
  @override
  State<CartPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: widget.addToCartPlants.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                    child: Image.asset('assets/images/add-cart.png'),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'سبد خرید تار عنکبوت بسته است',
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
              // height: size.height * 0.5,
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 30.0,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: widget.addToCartPlants.length,
                      itemBuilder: (context, index) {
                        return NewPlantWidget(
                          plantList: widget.addToCartPlants,
                          index: index,
                        );
                      },
                    ),
                  ),
                  Column(
                    children: [
                      const Divider(thickness: 1.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        
                        children: <Widget>[
                          Row(
                            children: [
                              SizedBox(
                                height: 20.0,
                                child: Image.asset(
                                  'assets/images/PriceUnit-green.png',
                                ),
                              ),
                              const SizedBox(width: 5.0),
                              Text(
                                '33000'.farsiNumber,
                                style: TextStyle(
                                  fontFamily: 'Lalezar',
                                  color: Constants.primaryColor,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w300
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'جمع کل',
                            style: TextStyle(
                              fontFamily: 'Lalezar',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
