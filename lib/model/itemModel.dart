class ItemListModel {
  List<ItemResponse> items;
  String message;
  String status;

  ItemListModel({
    required this.items,
    required this.message,
    required this.status,
  });

  factory ItemListModel.fromJson(Map<String, dynamic> json) {
    final dataList = (json['items'] as List<dynamic>)
        .map((item) => ItemResponse.fromJson(item))
        .toList();

    return ItemListModel(
      items: dataList,
      message: json['message'] as String,
      status: json['status'] as String,
    );
  }
}

class ItemResponse {

  String itemImage;
  String itemName;
  String itemDetails;

  ItemResponse(
      {required this.itemImage, required this.itemName, required this.itemDetails});

  factory ItemResponse.fromJson(Map<String, dynamic> json){
    return ItemResponse(
        itemImage: json['itemImage'],
        itemName: json['itemName'],
        itemDetails: json['itemDetails']);
  }


}

