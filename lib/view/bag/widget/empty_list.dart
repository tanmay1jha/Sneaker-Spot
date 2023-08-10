import 'package:flutter/material.dart';
import 'package:sneaker_spot/animation/fadeanimation.dart';
import 'package:sneaker_spot/theme/custom_app_theme.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        width: width,
        height: height / 1.4,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeAnimation(
              delay: 0.5,
              child:
                  Text("No shoes added!", style: AppThemes.bagEmptyListTitle),
            ),
            FadeAnimation(
              delay: 0.5,
              child: Text(
                "Hey! Once you have added, come back:)",
                style: AppThemes.bagEmptyListSubTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
