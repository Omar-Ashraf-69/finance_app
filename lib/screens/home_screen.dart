import 'package:finanice_app/colors/colors.dart';
import 'package:finanice_app/screens/adding_finance_screen.dart';
import 'package:finanice_app/screens/see_all_screen.dart';
import 'package:finanice_app/widgets/activity_widget.dart';
import 'package:finanice_app/widgets/money_banner_widget.dart';
import 'package:finanice_app/widgets/plus_minus_button_widget.dart';
import 'package:flutter/material.dart';

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
        surfaceTintColor: Colors.white,
        elevation: 0,
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
                bottomRight: Radius.circular(12),
              ),
              borderRadiusInsiderContanier: BorderRadius.only(
                bottomLeft: Radius.circular(12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  PlusAndMinsButtonWidget(
                      color: kSeconderyGreenColor,
                      label: 'Plus',
                      icon: Icons.add,
                      iconColor: kPrimaryGreenColor,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddingFinanceScreen(
                                isPlus: true,
                              ),
                            ));
                      }),
                  const SizedBox(
                    width: 20,
                  ),
                  PlusAndMinsButtonWidget(
                    color: kSeconderyRedColor,
                    label: 'Minus',
                    icon: Icons.remove,
                    iconColor: kPrimaryRedColor,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddingFinanceScreen(
                              isPlus: false,
                            ),
                          ));
                    },
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SeeAllScreen(),
                            ));
                      },
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
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) => const ActivityWidget(
                  title: 'title',
                  subTitle: 'Mon, Oct 16, 2023',
                  color: kSeconderyGreenColor,
                  trail: '+200.5',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
