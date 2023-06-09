import 'package:debt_controller/values/app_colors.dart';
import 'package:flutter/material.dart';

class UserDebtItem extends StatelessWidget {
  String fullName = "";
  String address = "";
  String phoneNumber = "";
  Function() clickItem;

  UserDebtItem(
      {super.key,
      required this.fullName,
      required this.address,
      required this.phoneNumber,
      required this.clickItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        clickItem.call();
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          right: 16,
          left: 16,
        ),
        child: Material(
          elevation: 3,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Container(
            height: 150,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: AppColors.white),
            child: Row(
              children: [
                getImage(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      getText(fullName),
                      getText(address),
                      getText(phoneNumber),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getImage() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 150,
        height: 150,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            color: AppColors.orange),
      ),
    );
  }

  getText(String str) {
    return Text(
      str,
      softWrap: false,
      maxLines: 2,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
    );
  }
}
