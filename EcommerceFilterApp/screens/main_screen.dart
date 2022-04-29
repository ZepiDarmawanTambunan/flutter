import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latihan/enums/enum_sort_by.dart';
import 'package:latihan/model/shop_results.dart';
import 'package:latihan/provider/shop_result_provider.dart';
import 'package:latihan/provider/sort_filter_provider.dart';
import 'package:latihan/screens/filter_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text("Results for \"Macbook\""),
        leading: Icon(Icons.chevron_left),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag),
            onPressed: () {},
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var width = constraints.maxWidth;
          return Column(
            children: [
              Container(
                height: 72,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            enableDrag:
                                false, // mengatur bisa digeser kebawah gak
                            isScrollControlled:
                                true, // didalam nya bisa discroll gak ?
                            backgroundColor: Colors.transparent,
                            builder: (context) => Container(
                              height: 320,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "SORT BY",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 100, 100, 100),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Consumer(
                                    builder: (context, ref, _) {
                                      final sort =
                                          ref.watch(sortFilterProvider);
                                      return Column(
                                        children: [
                                          RadioListTile<EnumSortBy>(
                                            value: EnumSortBy.recommended,
                                            groupValue: sort,
                                            title: Text(
                                              "Recommended",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            activeColor: Colors.black,
                                            onChanged: (v) {
                                              ref
                                                      .watch(sortFilterProvider
                                                          .notifier)
                                                      .state =
                                                  v ?? EnumSortBy.recommended;
                                              Navigator.pop(context);
                                            },
                                          ),
                                          RadioListTile<EnumSortBy>(
                                            value: EnumSortBy.recentlyAdded,
                                            groupValue: sort,
                                            activeColor: Colors.black,
                                            title: Text(
                                              "Recently Added",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            onChanged: (v) {
                                              ref
                                                      .watch(sortFilterProvider
                                                          .notifier)
                                                      .state =
                                                  v ?? EnumSortBy.recentlyAdded;
                                              Navigator.pop(context);
                                            },
                                          ),
                                          RadioListTile<EnumSortBy>(
                                            value: EnumSortBy.priceLowToHigh,
                                            groupValue: sort,
                                            activeColor: Colors.black,
                                            title: Text(
                                              "Price: Low to High",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            onChanged: (v) {
                                              ref
                                                      .watch(sortFilterProvider
                                                          .notifier)
                                                      .state =
                                                  v ??
                                                      EnumSortBy.priceLowToHigh;
                                              Navigator.pop(context);
                                            },
                                          ),
                                          RadioListTile<EnumSortBy>(
                                            value: EnumSortBy.priceHighToLow,
                                            groupValue: sort,
                                            activeColor: Colors.black,
                                            title: Text(
                                              "Price: High to Low",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            onChanged: (v) {
                                              ref
                                                      .watch(sortFilterProvider
                                                          .notifier)
                                                      .state =
                                                  v ??
                                                      EnumSortBy.priceHighToLow;
                                              Navigator.pop(context);
                                            },
                                          ),
                                          RadioListTile<EnumSortBy>(
                                            value: EnumSortBy.topRated,
                                            groupValue: sort,
                                            activeColor: Colors.black,
                                            title: Text(
                                              "Top rated",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            onChanged: (v) {
                                              ref
                                                      .watch(sortFilterProvider
                                                          .notifier)
                                                      .state =
                                                  v ?? EnumSortBy.topRated;
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.unfold_more),
                              Text("Sort by"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FilterScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.filter_list),
                              Text("Filter"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
                color: Colors.grey,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Consumer(builder: (context, ref, _) {
                    AsyncValue<List<ShopResult>> items =
                        ref.watch(shopResultProvider);
                    return items.when(
                      data: (datas) {
                        return GridView.builder(
                          itemCount: datas.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: width <= 600
                                ? 2
                                : width <= 1200
                                    ? 4
                                    : 6,
                            crossAxisSpacing: (width > 600) ? 12 : 18,
                            mainAxisSpacing: (width > 600) ? 12 : 18,
                            childAspectRatio: (width > 600) ? 5 / 8 : 5 / 6,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Positioned(
                                            left: 0,
                                            right: 0,
                                            top: 0,
                                            bottom: 0,
                                            child: Image.network(
                                              "${datas[index].img}",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            left: 0,
                                            right: 0,
                                            top: 0,
                                            bottom: 0,
                                            child: Container(
                                              color: (datas[index].isSoldOut ??
                                                      false)
                                                  ? Colors.black
                                                      .withOpacity(0.2)
                                                  : Colors.transparent,
                                            ),
                                          ),
                                          Positioned(
                                            left: 48,
                                            right: 48,
                                            child: (datas[index].isSoldOut ??
                                                    false)
                                                ? Container(
                                                    height: 32,
                                                    width: 64,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    child: Center(
                                                      child: Text("SOLD OUT"),
                                                    ),
                                                  )
                                                : Container(),
                                          ),
                                          Positioned(
                                            right: 2,
                                            top: 2,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: (datas[index].isSoldOut ??
                                                        false)
                                                    ? Icon(Icons
                                                        .notifications_none_outlined)
                                                    : Icon(
                                                        Icons.favorite_border),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: datas[index].vendor ??
                                                      "-",
                                                ),
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: datas[index].name ??
                                                          "-",
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  "\Rp. ${datas[index].price}"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      error: (e, s) {
                        return Center(
                          child: Text("$e, $s"),
                        );
                      },
                      loading: () => Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
