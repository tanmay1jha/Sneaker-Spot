import 'package:flutter/material.dart';
import 'package:sneaker_spot/utils/constants.dart';
import 'package:sneaker_spot/view/profile/widget/appbar.dart';
import 'package:sneaker_spot/view/profile/widget/body.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: customAppBarProfile(),
        body: const SingleChildScrollView(
          child: BodyProfile(),
        ),
      ),
    );
  }
}
