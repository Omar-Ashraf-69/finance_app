import 'package:finanice_app/colors/colors.dart';
import 'package:finanice_app/cubits/fetching_data/fetching_data_cubit_cubit.dart';
import 'package:finanice_app/cubits/fetching_data/fetching_data_cubit_state.dart';
import 'package:finanice_app/widgets/activity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class SeeAllScreen extends StatefulWidget {
  const SeeAllScreen({super.key});

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FetchingDataCubit()..fetchingDateData(DateTime.now()),
      child: BlocConsumer<FetchingDataCubit, FetchingDataState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "See All",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TableCalendar(
                    firstDay: DateTime.utc(2024, 01, 01),
                    lastDay: DateTime.utc(2025, 12, 31),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                          BlocProvider.of<FetchingDataCubit>(context)
                              .fetchingDateData(selectedDay);
                        });
                      }
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  state is FetchingDataCubitLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : BlocProvider.of<FetchingDataCubit>(context)
                              .todayFinanceList
                              .isEmpty
                          ? const Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Center(
                                child: Text(
                                  "No Data💔🙃🫠",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount:
                                    BlocProvider.of<FetchingDataCubit>(context)
                                        .todayFinanceList
                                        .length,
                                itemBuilder: (context, index) => ActivityWidget(
                                  title: BlocProvider.of<FetchingDataCubit>(
                                          context)
                                      .todayFinanceList[index]
                                      .transactionDetails,
                                  subTitle: DateFormat.yMMMEd().format(
                                      BlocProvider.of<FetchingDataCubit>(
                                              context)
                                          .todayFinanceList[index]
                                          .date),
                                  color: BlocProvider.of<FetchingDataCubit>(
                                                  context)
                                              .todayFinanceList[index]
                                              .balance >
                                          0
                                      ? kSeconderyGreenColor
                                      : kSeconderyRedColor,
                                  trail: BlocProvider.of<FetchingDataCubit>(
                                          context)
                                      .todayFinanceList[index]
                                      .balance
                                      .toString(),
                                ),
                              ),
                            ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
