// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:sneaker_spot/theme/custom_app_theme.dart';

import '../../../../utils/app_methods.dart';
import '../../../animation/fadeanimation.dart';
import '../../../data/shoes_data.dart';
import '../../../models/models.dart';
import '../../../utils/constants.dart';
import '../../../view/bag/widget/empty_list.dart';

class BodyBagView extends StatefulWidget {
  const BodyBagView({Key? key}) : super(key: key);

  @override
  _BodyBagViewState createState() => _BodyBagViewState();
}

class _BodyBagViewState extends State<BodyBagView>
    with SingleTickerProviderStateMixin {
  int lengthsOfItemsOnBag = itemsOnBag.length;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: width,
      height: height,
      child: Column(
        children: [
          topText(width, height),
          const Divider(
            color: Colors.grey,
          ),
          itemsOnBag.isEmpty
              ? EmptyList()
              : Column(children: [
                  mainListView(width, height),
                  const SizedBox(
                    height: 12,
                  ),
                  bottomInfo(width, height),
                ])
        ],
      ),
    );
  }

  topText(width, height) {
    return SizedBox(
      width: width,
      height: height / 14,
      child: FadeAnimation(
        delay: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("My Bag", style: AppThemes.bagTitle),
            Text(
              "Total ₹{lengthsOfItemsOnBag} Items",
              style: AppThemes.bagTotalPrice,
            ),
          ],
        ),
      ),
    );
  }

  materialButton(width, height) {
    return FadeAnimation(
      delay: 3,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minWidth: width / 1.2,
        height: height / 15,
        color: AppConstantsColor.materialButtonColor,
        onPressed: () {},
        child: const Text(
          "NEXT",
          style: TextStyle(color: AppConstantsColor.lightTextColor),
        ),
      ),
    );
  }

  mainListView(width, height) {
    return SizedBox(
      width: width,
      height: height / 1.6,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: itemsOnBag.length,
          itemBuilder: (ctx, index) {
            ShoeModel currentBagItem = itemsOnBag[index];

            return FadeAnimation(
              delay: 1.5 * index / 4,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 1),
                width: width,
                height: height / 5.2,
                child: Row(
                  children: [
                    SizedBox(
                      width: width / 2.8,
                      height: height / 5.7,
                      child: Stack(children: [
                        Positioned(
                          top: 20,
                          left: 10,
                          child: Container(
                            width: width / 3.6,
                            height: height / 7.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey[350],
                            ),
                          ),
                        ),
                        Positioned(
                            right: 2,
                            bottom: 15,
                            child: RotationTransition(
                              turns: const AlwaysStoppedAnimation(-40 / 360),
                              child: SizedBox(
                                width: 140,
                                height: 140,
                                child: Image(
                                  image: AssetImage(
                                    currentBagItem.imgAddress,
                                  ),
                                ),
                              ),
                            ))
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(currentBagItem.model,
                              style: AppThemes.bagProductModel),
                          const SizedBox(
                            height: 4,
                          ),
                          Text("\₹₹{currentBagItem.price}",
                              style: AppThemes.bagProductPrice),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    itemsOnBag.remove(currentBagItem);
                                    lengthsOfItemsOnBag = itemsOnBag.length;
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300],
                                  ),
                                  child: const Center(
                                      child: Icon(
                                    Icons.remove,
                                    size: 15,
                                  )),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("1",
                                  style: AppThemes.bagProductNumOfShoe),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300],
                                  ),
                                  child: const Center(
                                      child: Icon(
                                    Icons.add,
                                    size: 15,
                                  )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  bottomInfo(width, height) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      width: width,
      height: height / 7,
      child: Column(
        children: [
          FadeAnimation(
            delay: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("TOTAL", style: AppThemes.bagTotalPrice),
                Text("\₹${AppMethods.sumOfItemsOnBag()}",
                    style: AppThemes.bagSumOfItemOnBag),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          materialButton(width, height)
        ],
      ),
    );
  }
}
