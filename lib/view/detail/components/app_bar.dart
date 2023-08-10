import 'package:flutter/material.dart';
import 'package:sneaker_spot/theme/custom_app_theme.dart';
import 'package:sneaker_spot/utils/constants.dart';

PreferredSize? customAppBarDe(ctx) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: const Text("Nike", style: AppThemes.detailsAppBar),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(ctx);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: AppConstantsColor.darkTextColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
        ),
      ],
    ),
  );
}
