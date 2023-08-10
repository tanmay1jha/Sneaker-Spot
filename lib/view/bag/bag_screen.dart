import 'package:flutter/material.dart';
import 'package:sneaker_spot/utils/constants.dart';
import 'package:sneaker_spot/view/bag/widget/main_body.dart';

class MyBagScreen extends StatelessWidget {
  const MyBagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        body: BodyBagView(),
      ),
    );
  }
}
