import 'dart:io';

import 'package:finanice_app/colors/colors.dart';
import 'package:finanice_app/cons.dart';
import 'package:finanice_app/cubits/fetching_data/fetching_data_cubit_cubit.dart';
import 'package:finanice_app/cubits/fetching_data/fetching_data_cubit_state.dart';
import 'package:finanice_app/screens/adding_finance_screen.dart';
import 'package:finanice_app/screens/see_all_screen.dart';
import 'package:finanice_app/widgets/activity_widget.dart';
import 'package:finanice_app/widgets/money_banner_widget.dart';
import 'package:finanice_app/widgets/plus_minus_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchingDataCubit, FetchingDataState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ValueListenableBuilder(
          valueListenable: Hive.box(darkModeBox).listenable(),
          builder: (context, box, child) {
            var darkMode = box.get('darkMode', defaultValue: false);

            return Scaffold(
              appBar: AppBar(
                surfaceTintColor: Colors.white,
                elevation: 0,
                title: const Text("Welcome, Omar"),
                actions: [
                  IconButton(
                    onPressed: () {
                      box.put('darkMode', !darkMode);
                    },
                    icon: darkMode
                        ? const Icon(Icons.brightness_2)
                        : const Icon(
                            Icons.brightness_7_sharp,
                          ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    MoneyBannerWidget(
                      totaleBalance: 'My Balance',
                      todayBalance:
                          "\$ ${BlocProvider.of<FetchingDataCubit>(context).totalBalance}",
                      color: BlocProvider.of<FetchingDataCubit>(context)
                                  .todayBalance >
                              0
                          ? kSeconderyPurbleColor
                          : kSeconderyBlueColor,
                      borderRadiusOuterContanier: const BorderRadius.only(
                        topRight: Radius.circular(12),
                      ),
                      borderRadiusInsiderContanier: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                      ),
                    ),
                    MoneyBannerWidget(
                      totaleBalance: 'Today',
                      todayBalance:
                          "\$ ${BlocProvider.of<FetchingDataCubit>(context).todayBalance}",
                      color: BlocProvider.of<FetchingDataCubit>(context)
                                  .todayBalance >
                              0
                          ? kSeconderyGreenColor
                          : kSeconderyRedColor,
                      borderRadiusOuterContanier: const BorderRadius.only(
                        bottomRight: Radius.circular(12),
                      ),
                      borderRadiusInsiderContanier: const BorderRadius.only(
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
                                      builder: (context) =>
                                          const AddingFinanceScreen(
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
                                    builder: (context) =>
                                        const AddingFinanceScreen(
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
                                      builder: (context) =>
                                          const SeeAllScreen(),
                                    ));
                              },
                              child: const Text(
                                "See All",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: BlocProvider.of<FetchingDataCubit>(context)
                            .dateFinanceList
                            .length,
                        itemBuilder: (context, index) => ActivityWidget(
                            title: BlocProvider.of<FetchingDataCubit>(context)
                                .dateFinanceList[index]
                                .transactionDetails,
                            subTitle: DateFormat.yMMMEd().format(
                                BlocProvider.of<FetchingDataCubit>(context)
                                    .dateFinanceList[index]
                                    .date),
                            color: BlocProvider.of<FetchingDataCubit>(context)
                                        .dateFinanceList[index]
                                        .balance >
                                    0
                                ? kSeconderyGreenColor
                                : kSeconderyRedColor,
                            trail: BlocProvider.of<FetchingDataCubit>(context)
                                        .dateFinanceList[index]
                                        .balance >
                                    0
                                ? "+ ${BlocProvider.of<FetchingDataCubit>(context).dateFinanceList[index].balance.toString()}"
                                : BlocProvider.of<FetchingDataCubit>(context)
                                    .dateFinanceList[index]
                                    .balance
                                    .toString(),
                            onDismissed: (direction) {
                              if (direction == DismissDirection.endToStart) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: const Text(
                                            "Are you sure you want to delete "),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text(
                                              "Delete",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                            onPressed: () {
                                              BlocProvider.of<
                                                          FetchingDataCubit>(
                                                      context)
                                                  .todayFinanceList[index]
                                                  .delete();
                                              BlocProvider.of<
                                                          FetchingDataCubit>(
                                                      context)
                                                  .fetchingData();
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            onPressed: () {
                                              BlocProvider.of<
                                                          FetchingDataCubit>(
                                                      context)
                                                  .fetchingData();
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddingFinanceScreen(
                                        isPlus:
                                            BlocProvider.of<FetchingDataCubit>(
                                                            context)
                                                        .todayFinanceList[index]
                                                        .balance >
                                                    0
                                                ? true
                                                : false,
                                        financeModel:
                                            BlocProvider.of<FetchingDataCubit>(
                                                    context)
                                                .todayFinanceList[index],
                                      ),
                                    ));
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              drawer: Drawer(
                child: Column(
                  children: [
                    const DrawerHeader(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            child: Text("OMAR"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Omar Ashraf",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            title: const Text(
                              "Dark Mode",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            trailing: Switch(
                              value: darkMode,
                              onChanged: (value) {
                                box.put('darkMode', !darkMode);
                              },
                            ),
                          ),
                          Divider(),
                          ListTile(
                            title: Text(
                              "All Activities",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            trailing: Icon(
                              Icons.local_activity,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SeeAllScreen(),
                                  ));
                            },
                          ),
                          ListTile(
                            title: Text(
                              "Close Drawer",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            trailing: Icon(
                              Icons.close,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "Exit",
                      ),
                      trailing: const Icon(Icons.logout),
                      onTap: () => exit(0),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
