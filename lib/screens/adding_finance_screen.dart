import 'package:finanice_app/colors/colors.dart';
import 'package:flutter/material.dart';

class AddingFinanceScreen extends StatefulWidget {
  const AddingFinanceScreen({super.key});

  @override
  State<AddingFinanceScreen> createState() => _AddingFinanceScreenState();
}

class _AddingFinanceScreenState extends State<AddingFinanceScreen> {
  String value = "";

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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Plus",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const AddingDetailsContainerWidget(
              color: kSeconderyPurbleColor,
              widget: SizedBox(
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Details here...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AddingDetailsContainerWidget(
              color: kSeconderyGreenColor,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add,
                    color: kPrimaryGreenColor,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    value.isEmpty ? '0.0' : value.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      color: kPrimaryGreenColor,
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 3 / 2,
                ),
                reverse: true,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    if (numbersGridItem[index] == '<' && value.isNotEmpty) {
                      value = value.substring(0, value.length - 1);
                      setState(() {});
                    } else {
                      if (numbersGridItem[index] == '.' &&
                          value.contains('.')) {
                        value = value;
                        setState(() {});
                      } else {
                        if (numbersGridItem[index] != '<') {
                          value = value + numbersGridItem[index];
                        }
                        setState(() {});
                      }
                    }
                  },
                  child: NumbersContanier(number: numbersGridItem[index]),
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                DoneAndCancelButtonWidget(
                  label: "Done",
                  textColor: kPrimaryBlueColor,
                  backgroundColor: kSeconderyBlueColor,
                  value: value,
                  onTap: () {
                    if (value.isNotEmpty) {
                      //to add to the database. and then pop 
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
  }
}

class DoneAndCancelButtonWidget extends StatelessWidget {
  const DoneAndCancelButtonWidget({
    super.key,
    required this.textColor,
    required this.backgroundColor,
    required this.label,
    this.value = '',
    this.onTap,
  });
  final Color textColor;
  final Color backgroundColor;
  final String label;
  final String value;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AddingDetailsContainerWidget(
          color: backgroundColor,
          widget: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NumbersContanier extends StatelessWidget {
  const NumbersContanier({
    super.key,
    required this.number,
  });
  final String number;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: kBlackColor,
      ),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class AddingDetailsContainerWidget extends StatelessWidget {
  const AddingDetailsContainerWidget({
    super.key,
    required this.color,
    required this.widget,
  });
  final Color color;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 16,
      ),
      child: widget,
    );
  }
}
