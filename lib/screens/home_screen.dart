import 'package:finanice_app/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome, Omar"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.brightness_7_sharp,
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            MoneyBannerWidget(
              totaleBalance: 'My Balance',
              todayBalance: '689',
              color: kSeconderyPurbleColor,
              borderRadiusOuterContanier: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              borderRadiusInsiderContanier: BorderRadius.only(
                topLeft: Radius.circular(12),
              ),
            ),
            MoneyBannerWidget(
              totaleBalance: 'Today',
              todayBalance: '0.00',
              color: kSeconderyRedColor,
              borderRadiusOuterContanier: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              borderRadiusInsiderContanier: BorderRadius.only(
                bottomLeft: Radius.circular(12),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

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
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadiusOuterContanier,
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kBlackColor,
                borderRadius: borderRadiusInsiderContanier,
              ),
              padding: const EdgeInsets.all(12),
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    totaleBalance,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
          ],
        ),
      ),
    );
  }
}
