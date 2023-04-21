import 'package:flutter/material.dart';

import '../../../values/app_colors.dart';

class DebtItem extends StatelessWidget {
  const DebtItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, right: 16, left: 16),
      child: Material(
        elevation: 3,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              color: AppColors.white),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              right: 16,
              left: 16,
              bottom: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getText("Mijoz", "Saydaliev Akhror"),
                getText("Telefon raqami", "+998 90 524 0993"),
                getText("Nomi", "IPhone X"),
                getText("Rangi", "Qora"),
                getText("Jami summa", "1000"),
                getText("Boshlang'ich summa", "300"),
                getText("Boshlanish sanasi", "10.01.2022"),
                getText("Tugash sanasi", "10.01.2023"),
                getText("Qo'shimcha malumot",
                    "cjdscnjdnscjdncncdnckd jdcdkmckmdksmckdsmckmc dkcmdskcmmdscmdsmckc dskckdsmcmdsc d skcs"),
                getPicture()
              ],
            ),
          ),
        ),
      ),
    );
  }

  getText(String str, String des) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$str:  ',
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.orange,
            ),
          ),
          Expanded(
            child: Text(
              des,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  getPicture() {
    return Padding(
      padding: const EdgeInsets.only( top: 16),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.background,
                        ),
                        child: const Icon(
                          Icons.person,
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

}
