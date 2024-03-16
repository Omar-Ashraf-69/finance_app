import 'package:finanice_app/colors/colors.dart';
import 'package:finanice_app/cubits/add_finance/add_finance_data_cubit.dart';
import 'package:finanice_app/cubits/add_finance/add_finance_data_state.dart';
import 'package:finanice_app/cubits/fetching_data/fetching_data_cubit_cubit.dart';
import 'package:finanice_app/models/finance_model.dart';
import 'package:finanice_app/widgets/adding_details_container_widget.dart';
import 'package:finanice_app/widgets/done_cancel_button_widget.dart';
import 'package:finanice_app/widgets/numbers_contanier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddingFinanceScreen extends StatefulWidget {
  const AddingFinanceScreen(
      {super.key, required this.isPlus, this.financeModel});
  final bool isPlus;
  final FinanceModel? financeModel;
  @override
  State<AddingFinanceScreen> createState() => _AddingFinanceScreenState();
}

class _AddingFinanceScreenState extends State<AddingFinanceScreen> {
  String value = "";
  final TextEditingController controller = TextEditingController();
  final List<String> numbersGridItem = [
    '.',
    '0',
    '<',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddFinanceDataCubit(),
      child: BlocBuilder<AddFinanceDataCubit, AddFinanceDataState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(
                widget.isPlus ? "Plus" : 'Minus',
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  AddingDetailsContainerWidget(
                    color: kSeconderyPurbleColor,
                    widget: SizedBox(
                      height: 40,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: controller,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          hintText: widget.financeModel != null
                              ? widget.financeModel!.transactionDetails
                              : 'Details here...',
                          border: InputBorder.none,
                          hintStyle: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AddingDetailsContainerWidget(
                    color: widget.isPlus
                        ? kSeconderyGreenColor
                        : kSeconderyRedColor,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.isPlus
                            ? const Icon(
                                Icons.add,
                                color: kPrimaryGreenColor,
                              )
                            : const Icon(
                                Icons.remove,
                                color: kPrimaryRedColor,
                              ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          value.isEmpty
                              ? widget.financeModel != null
                                  ? widget.financeModel!.balance
                                      .toString()
                                      .substring(1)
                                  : '0.0'
                              : value.toString(),
                          style: TextStyle(
                            fontSize: 24,
                            color: widget.isPlus
                                ? kPrimaryGreenColor
                                : kPrimaryRedColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 340,
                    child: GridView.builder(
                      itemCount: numbersGridItem.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 3 / 2,
                      ),
                      reverse: true,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => updateValue(numbersGridItem[index]),
                        child: NumbersContanier(number: numbersGridItem[index]),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      state is AddFinanceDataLoading
                          ? const CircularProgressIndicator()
                          : DoneAndCancelButtonWidget(
                              label: "Done",
                              textColor: kPrimaryBlueColor,
                              backgroundColor: kSeconderyBlueColor,
                              value: value,
                              onTap: () async {
                                if (value.isNotEmpty ||
                                    widget.financeModel != null) {
                                  if (widget.financeModel == null) {
                                    await BlocProvider.of<AddFinanceDataCubit>(
                                            context)
                                        .addFinanceData(
                                      FinanceModel(
                                        balance: widget.isPlus
                                            ? double.parse(value)
                                            : double.parse(value) * -1,
                                        date: DateTime.now(),
                                        transactionDetails: controller.text,
                                      ),
                                    );
                                  } else {
                                    value.isNotEmpty
                                        ? widget.financeModel!.balance =
                                            widget.isPlus
                                                ? double.parse(value)
                                                : double.parse(value) * -1
                                        : widget.financeModel!.balance =
                                            widget.financeModel!.balance;
                                    controller.text.isEmpty
                                        ? widget.financeModel!
                                                .transactionDetails =
                                            widget.financeModel!
                                                .transactionDetails
                                        : widget.financeModel!
                                                .transactionDetails =
                                            controller.text;
                                  }
                                  BlocProvider.of<FetchingDataCubit>(context)
                                      .fetchingData();
                                  BlocProvider.of<FetchingDataCubit>(context)
                                      .fetchingDateData(
                                          BlocProvider.of<FetchingDataCubit>(
                                                  context)
                                              .selectedDate);
                                  Navigator.pop(context);
                                }
                              },
                            ),
                      const SizedBox(
                        width: 10,
                      ),
                      DoneAndCancelButtonWidget(
                        label: 'Cancel',
                        textColor: kPrimaryRedColor,
                        backgroundColor: kSeconderyRedColor,
                        onTap: () => Navigator.pop(context),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void updateValue(String item) {
    setState(() {
      if (item == '<' && value.isNotEmpty) {
        value = value.substring(0, value.length - 1);
      } else if (item == '.' && value.contains('.')) {
        // Do nothing
      } else if (item != '<') {
        value += item;
      }
    });
  }
}
