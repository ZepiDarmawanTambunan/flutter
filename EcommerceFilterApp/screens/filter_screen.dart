import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latihan/controllers/currency_format_controller.dart';
import 'package:latihan/enums/enum_customer_review.dart';
import 'package:latihan/provider/customer_review_provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _tmp = [false, false, false];

  Map<int, dynamic> dataColor = {
    1: [Colors.black, "black"],
    2: [Colors.greenAccent, "green"],
    3: [Colors.blueAccent, "blue"],
    4: [Colors.redAccent, "merah"],
    5: [Colors.pinkAccent, "pink"]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Reset"),
            style: TextButton.styleFrom(primary: Colors.black),
          ),
        ],
        title: Text(
          "Filter",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        margin: EdgeInsets.only(
          top: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                Text(
                  "Brand",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
            SizedBox(
              child: Wrap(
                // direction: Axis.vertical,
                runSpacing: 6,
                spacing: 6,
                children: [
                  InputChip(
                    label: Text('Ardell'),
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.black,
                    disabledColor: Colors.grey,
                    isEnabled: true,
                    selectedColor: Colors.black,
                    deleteIcon: Icon(Icons.check, size: 14),
                    deleteIconColor: Colors.white,
                    onDeleted: () {
                      print('delete');
                    },
                    onSelected: (b) {
                      print("$b");
                      setState(() {});
                    },
                    selected: _tmp[0],
                  ),
                  InputChip(
                    label: Text('bareMinerals'),
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.black,
                    disabledColor: Colors.grey,
                    isEnabled: true,
                    selectedColor: Colors.black,
                    deleteIcon: Icon(Icons.check, size: 14),
                    deleteIconColor: Colors.white,
                    onDeleted: () {
                      print('delete');
                    },
                    onSelected: (b) {
                      print("$b");
                      setState(() {});
                    },
                    selected: _tmp[1],
                  ),
                  InputChip(
                    label: Text('Clate'),
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.black,
                    disabledColor: Colors.grey,
                    isEnabled: true,
                    selectedColor: Colors.black,
                    deleteIcon: Icon(Icons.check, size: 14),
                    deleteIconColor: Colors.white,
                    onDeleted: () {
                      print('delete');
                    },
                    onSelected: (b) {
                      print("$b");
                      setState(() {});
                    },
                    selected: _tmp[2],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            ExpansionTile(
              textColor: Colors.black,
              iconColor: Colors.black,
              title: Text("Color"),
              initiallyExpanded: true,
              children: [
                SizedBox(
                  height: 64,
                  child: ListView.builder(
                    itemCount: dataColor.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: InputChip(
                            label: Text("Gray"),
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            selectedColor: Colors.black,
                            backgroundColor: Colors.black,
                            avatar: CircleAvatar(
                              backgroundColor: Colors.grey,
                            ),
                            deleteIconColor: Colors.white,
                            onSelected: (s) {},
                            onDeleted: () {},
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(dataColor[index][1]),
                          selected: false,
                          avatar: CircleAvatar(
                            backgroundColor: dataColor[index][0],
                          ),
                          shape: StadiumBorder(side: BorderSide()),
                          backgroundColor: Colors.transparent,
                          onSelected: (b) {},
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            ExpansionTile(
              textColor: Colors.black,
              iconColor: Colors.black,
              title: Text("Price Range"),
              initiallyExpanded: true,
              trailing: Text(
                  "${CurrencyFormat.convertToIdr(rangeValue.start.toInt(), 0)} - ${CurrencyFormat.convertToIdr(rangeValue.end.toInt(), 0)}"),
              children: [
                RangeSlider(
                  activeColor: Colors.black,
                  inactiveColor: Colors.grey,
                  min: 5000000, // boleh dimulai dari harga 0 rupiah
                  max: 80000000,
                  values: rangeValue,
                  onChanged: (b) {
                    setState(() {
                      rangeValue = b;
                    });
                  },
                ),
              ],
            ),
            ExpansionTile(
              iconColor: Colors.black,
              textColor: Colors.black,
              title: Text("Customer Review"),
              initiallyExpanded: true,
              children: [
                Consumer(
                  builder: (context, ref, _) {
                    final customerReview = ref.watch(customerReviewProvider);
                    return Column(
                      children: [
                        RadioListTile<EnumCustomerReview>(
                          value: EnumCustomerReview.four,
                          groupValue: customerReview,
                          title: Row(
                            children: [
                              ...List<Widget>.generate(
                                4,
                                (index) => Icon(
                                  Icons.star,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ).toList(),
                              const SizedBox(width: 8),
                              Text("& Up"),
                            ],
                          ),
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: Colors.black,
                          onChanged: (v) {
                            ref.watch(customerReviewProvider.notifier).state =
                                v ?? EnumCustomerReview.four;
                          },
                        ),
                        RadioListTile<EnumCustomerReview>(
                          value: EnumCustomerReview.three,
                          groupValue: customerReview,
                          title: Row(
                            children: [
                              ...List<Widget>.generate(
                                3,
                                (index) => Icon(
                                  Icons.star,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ).toList(),
                              const SizedBox(width: 25),
                              Text("& Up"),
                            ],
                          ),
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: Colors.black,
                          onChanged: (v) {
                            ref.watch(customerReviewProvider.notifier).state =
                                v ?? EnumCustomerReview.three;
                          },
                        ),
                        RadioListTile<EnumCustomerReview>(
                          value: EnumCustomerReview.two,
                          groupValue: customerReview,
                          title: Row(
                            children: [
                              ...List<Widget>.generate(
                                2,
                                (index) => Icon(
                                  Icons.star,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ).toList(),
                              const SizedBox(width: 42),
                              Text("& Up"),
                            ],
                          ),
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: Colors.black,
                          onChanged: (v) {
                            ref.watch(customerReviewProvider.notifier).state =
                                v ?? EnumCustomerReview.two;
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  RangeValues rangeValue = RangeValues(5000000, 80000000);
}
