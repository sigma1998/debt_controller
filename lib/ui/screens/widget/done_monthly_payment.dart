import 'package:debt_controller/values/app_colors.dart';
import 'package:flutter/material.dart';

class DoneMonthlyPayment extends StatelessWidget {
  const DoneMonthlyPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        right: 16,
        left: 16,
      ),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: AppColors.lightGreen),
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16),
            child: Column(
              children: [
                getText('To\'lov sanasi', '01.02.2023'),
                getText('To\'langan sanasi', '01.02.2023'),
                getText('Qo\'shimcha malumot',
                    'csgcg hcdbshcb hdcscndsj cdnjscn cjdncns jndcscnsd cjsncsjc  '),
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
      padding: const EdgeInsets.only(top: 4.0, right: 16, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$str:  ',
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.black,
            ),
          ),
          Expanded(
            child: Text(
              des,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 18,
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
      padding: const EdgeInsets.only( top: 16, bottom: 8),
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
                          color: AppColors.white,
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
