import 'package:azinova_machine_test/constants.dart';
import 'package:azinova_machine_test/methods.dart';
import 'package:azinova_machine_test/pages/detail_screen.dart';
import 'package:flutter/material.dart';

import 'model/itemModel.dart';


Container fullWidthPrimaryButton(
    BuildContext context, Function() onClick, String label) {
  return Container(
    padding: const EdgeInsets.only(top: 16, bottom: 16),
    width: double.infinity,
    color: Colors.transparent,
    child: Padding(
      padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        onPressed: onClick,
        child: Ink(
          padding: const EdgeInsetsDirectional.only(start: 10.0, end: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
                stops: [0.0, 10.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppConstants.kSecondaryColor,
                  AppConstants.kPrimaryColor,
                ]),
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            constraints: const BoxConstraints(minWidth: 88.0),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget getItemUI(BuildContext context, int index, List<ItemResponse> itemListDetails) {
  return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Image.network(
              itemListDetails[index].itemImage,
              fit: BoxFit.cover,
              width: 100.0,
            ),

            title: Text(
              itemListDetails[index].itemName,
              style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(itemListDetails[index].itemDetails,
                style: const TextStyle(
                    fontSize: 11.0, fontWeight: FontWeight.normal)),
            //trailing: ,
            onTap: () {
              saveApiResults(itemListDetails[index],AppConstants.SINGLE_DETAILS);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsScreen(item: itemListDetails[index]),));
            },
          )
        ],
      ));
}