import 'package:allena_tech/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../utils/app_configs.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String? appBarTitle;
  final String? appBarSubTitle;
  final VoidCallback? onPress;
  final Widget? iconWidget;
  const CustomSliverAppBar({
    this.appBarSubTitle,
    this.appBarTitle,
    this.onPress,
    this.iconWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColor.appBarColor,
      elevation: 8.0,
      forceElevated: true,
      floating: true,
      leading: IconButton(
        onPressed: onPress,
        icon: iconWidget ?? const Text(''),
      ),
      expandedHeight: 80,
      // title: ,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          padding: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appBarTitle ?? 'Register',
                style: AppConfig.kSemiBoldTxtStyle
                    .copyWith(color: Colors.white, fontSize: 20),
              ),
              Text(appBarSubTitle ?? 'Create Your account',
                  style: AppConfig.kWhiteText),
            ],
          ),
        ),
      ),
    );
  }
}
