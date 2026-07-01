import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/screens/detail_page.dart';
import 'package:plant_app/widgets/extensions.dart';

class NewPlantWidget extends StatelessWidget {
  final List<Plant> _plantList;
  final int index;
  const NewPlantWidget({
    super.key,
    required this._plantList,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: DetailPage(plantId: _plantList[index].plantId),
            type: PageTransitionType.topToBottom,
          ),
        );
      },
      child: Container(
        height: 80.0,
        width: size.width,
        margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
        decoration: BoxDecoration(
          color: Constants.primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                SizedBox(
                  height: 20.0,
                  child: Image.asset('assets/images/PriceUnit-green.png'),
                ),
                const SizedBox(width: 5.0),
                Text(
                  _plantList[index].price.toString().farsiNumber,
                  style: TextStyle(
                    fontFamily: 'Lalezar',
                    color: Constants.primaryColor,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withValues(alpha: 0.8),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  bottom: 5.0,
                  left: 0.0,
                  right: 0.0,
                  child: SizedBox(
                    height: 80.0,
                    child: Image.asset(_plantList[index].imageURL),
                  ),
                ),
                Positioned(
                  bottom: 5.0,
                  right: 80.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        _plantList[index].category,
                        style: const TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'BYekan',
                        ),
                      ),
                      Text(
                        _plantList[index].plantName,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'BYekan',
                          color: Constants.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
