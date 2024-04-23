import 'package:azinova_machine_test/model/itemModel.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final ItemResponse item;

  const DetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' ${item.itemName}')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(item.itemImage),
              const SizedBox(height: 16),
              Center(
                child: Text(item.itemDetails,
                    style: const TextStyle(
                      color: Colors.grey,
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
