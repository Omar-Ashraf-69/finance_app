import 'package:finanice_app/colors/colors.dart';
import 'package:finanice_app/widgets/adding_details_container_widget.dart';
import 'package:finanice_app/widgets/done_cancel_button_widget.dart';
import 'package:finanice_app/widgets/numbers_contanier.dart';
import 'package:flutter/material.dart';

class AddingFinanceScreen extends StatefulWidget {
  const AddingFinanceScreen({super.key, required this.isPlus});
  final bool isPlus;

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
        title: Text(
          widget.isPlus ? "Plus" : 'Minus',
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
              color: widget.isPlus ? kSeconderyGreenColor : kSeconderyRedColor,
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
                    value.isEmpty ? '0.0' : value.toString(),
                    style: TextStyle(
                      fontSize: 24,
                      color:
                          widget.isPlus ? kPrimaryGreenColor : kPrimaryRedColor,
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
                  onTap: () => updateValue(numbersGridItem[index]),
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
