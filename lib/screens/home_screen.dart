import 'package:finanice_app/colors/colors.dart';
import 'package:finanice_app/cubits/fetching_data/fetching_data_cubit_cubit.dart';
import 'package:finanice_app/cubits/fetching_data/fetching_data_cubit_state.dart';
import 'package:finanice_app/screens/adding_finance_screen.dart';
import 'package:finanice_app/screens/see_all_screen.dart';
import 'package:finanice_app/widgets/activity_widget.dart';
import 'package:finanice_app/widgets/money_banner_widget.dart';
import 'package:finanice_app/widgets/plus_minus_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchingDataCubit, FetchingDataCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                MoneyBannerWidget(
                  totaleBalance: 'My Balance',
                  todayBalance: BlocProvider.of<FetchingDataCubit>(context)
                      .totalBalance
                      .toString(),
                  color:
                      BlocProvider.of<FetchingDataCubit>(context).todayBalance >
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
                  todayBalance: BlocProvider.of<FetchingDataCubit>(context)
                      .todayBalance
                      .toString(),
                  color:
                      BlocProvider.of<FetchingDataCubit>(context).todayBalance >
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
                    itemCount: BlocProvider.of<FetchingDataCubit>(context)
                        .todayFinanceList
                        .length,
                    itemBuilder: (context, index) => ActivityWidget(
                        title: BlocProvider.of<FetchingDataCubit>(context)
                            .todayFinanceList[index]
                            .transactionDetails,
                        subTitle: DateFormat.yMMMEd().format(
                            BlocProvider.of<FetchingDataCubit>(context)
                                .todayFinanceList[index]
                                .date),
                        color: BlocProvider.of<FetchingDataCubit>(context)
                                    .todayFinanceList[index]
                                    .balance >
                                0
                            ? kSeconderyGreenColor
                            : kSeconderyRedColor,
                        trail: BlocProvider.of<FetchingDataCubit>(context)
                            .todayFinanceList[index]
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
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        onPressed: () {
                                          BlocProvider.of<FetchingDataCubit>(
                                                  context)
                                              .todayFinanceList[index]
                                              .delete();
                                          BlocProvider.of<FetchingDataCubit>(
                                                  context)
                                              .fetchingData();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () {
                                          BlocProvider.of<FetchingDataCubit>(
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
                                    isPlus: BlocProvider.of<FetchingDataCubit>(
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
        );
      },
    );
  }
}
