import 'package:flutter/cupertino.dart';

import '../../../values/app_colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        radius: 16,
        color: AppColors.white,
      ),
    );
  }
}
