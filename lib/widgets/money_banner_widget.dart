
import 'package:finanice_app/colors/colors.dart';
import 'package:flutter/material.dart';

class MoneyBannerWidget extends StatelessWidget {
  const MoneyBannerWidget({
    super.key,
    required this.totaleBalance,
    required this.todayBalance,
    required this.color,
    required this.borderRadiusOuterContanier,
    required this.borderRadiusInsiderContanier,
  });
  final String totaleBalance;
  final String todayBalance;
  final Color color;
  final BorderRadius borderRadiusOuterContanier;
  final BorderRadius borderRadiusInsiderContanier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 135,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: kBlackColor,
                  borderRadius: borderRadiusInsiderContanier,
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      totaleBalance,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      todayBalance,
                      style: const TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 70,
              decoration: BoxDecoration(
                color: color,
                borderRadius: borderRadiusOuterContanier,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
