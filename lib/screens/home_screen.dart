import 'package:finanice_app/colors/colors.dart';
import 'package:flutter/cupertino.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            const MoneyBannerWidget(
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
            const MoneyBannerWidget(
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
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PlusAndMinsButtonWidget(
                    color: kSeconderyGreenColor,
                    label: 'Plus',
                    signe: '+',
                  ),
                  PlusAndMinsButtonWidget(
                    color: kSeconderyRedColor,
                    label: 'Mins',
                    signe: '-',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                children: [
                  const Text(
                    "Activity",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "See All",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                ],
              ),
            ),
            const ActivityWidget(
              title: 'title',
              subTitle: 'Mon, Oct 16, 2023',
              color: kSeconderyGreenColor,
              trail: '+200.5',
            ),
            const ActivityWidget(
              title: 'title',
              subTitle: 'Mon, Oct 16, 2023',
              color: kSeconderyGreenColor,
              trail: '+200.5',
            ),
            const ActivityWidget(
              title: 'title',
              subTitle: 'Mon, Oct 16, 2023',
              color: kSeconderyRedColor,
              trail: '-100.5',
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.trail,
    required this.color,
  });
  final String title;
  final String subTitle;
  final String trail;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.circle,
        color: color,
        size: 50,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      trailing: Text(
        trail,
        style: const TextStyle(
          fontSize: 17,
        ),
      ),
    );
  }
}

class PlusAndMinsButtonWidget extends StatelessWidget {
  const PlusAndMinsButtonWidget({
    super.key,
    required this.color,
    required this.signe,
    required this.label,
  });
  final Color color;
  final String signe;
  final String label;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
        ),
        width: size.width * 0.45,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              signe,
              style: const TextStyle(
                fontSize: 24,
                color: kPrimaryGreenColor,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
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
