import 'dart:convert';
import 'dart:developer';

import 'package:azinova_machine_test/methods.dart';
import 'package:azinova_machine_test/model/itemModel.dart';
import 'package:flutter/material.dart';

import '../common.dart';
import '../constants.dart';
import '../network/apiCall.dart';
import '../widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  List<ItemResponse> itemListDetails = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void _stopLoading() {
    setState(() {
      isLoading = false;
    });
  }

  Future<void> getData() async {
    try {
      final response = await GetListItems(context);
      if (response?.body != null) {
        final bodyasjson = jsonDecode(response!.body) as Map<String, dynamic>;
        final _result = ItemListModel.fromJson(bodyasjson);
        if (_result.status == 'success' && _result.items.isNotEmpty) {
          itemListDetails.clear();
          setState(() {
            isLoading = false;
            for (var listItemData in _result.items) {
              ItemResponse itemDetails = listItemData;
              itemListDetails.add(itemDetails);
              saveApiResults(itemDetails,AppConstants.ITEM_DETAILS);
            }
          });
          ItemResponse pr = itemListDetails.elementAt(0);
          log('Response next   ${pr.itemName}');
        } else {
          _stopLoading();
          showSnackBar(context, "No Data Found");
        }
      } else {
        _stopLoading();
      }
    } catch (e) {
      _stopLoading();
      showSnackBar(context, "Some Error Occurred");
      log('Catch Error list... $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Fruit Items",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10);
                },
                itemCount: itemListDetails.length,
                itemBuilder: (context, index) => getItemUI(context, index,itemListDetails),
              ),
            )),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }


}
